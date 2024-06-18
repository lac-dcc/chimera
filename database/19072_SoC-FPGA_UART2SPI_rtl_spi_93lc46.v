// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*                                                                       *
//*  UART2SPI                                              
//*  File : spi_93lc46.v                                             
//*  Author: abdelazeem                                                   *
//*  Revision 0.1                                                         *
//*  Date     2024/01/26                                                  *
//*  Email : a.abdelazeem201.com                                          *
//                                                                        *
//*************************************************************************
module spi_93lc46(
        input clkin,
        input reset,
        input mi,
        input write,
        input read,
        input [7:0] spi_addr_i,
        input [7:0] spi_data_i,
        output sck,
        output reg cs,
        output reg mo,
         output rd_done,
        output  [7:0] data_out
    );

        parameter div =49;
        reg [5:0] div_cnt = 6'b0;
        reg        spi_clk ;
        wire spi_clk_g;
 
        reg          true_write = 1'b0;
        always @ (posedge clkin)
                begin
                	  if(reset) div_cnt <= 6'b0;
                	  else begin
                        if(div_cnt == 49) div_cnt <= 6'b0;
                        else div_cnt <= div_cnt + 1;
                      end
                end
        always @ (posedge clkin)
                begin   
                	      if(reset) spi_clk <= 0;
                	      else begin
                        if(div_cnt == 24) spi_clk <= !spi_clk;
                        else if(div_cnt == div) spi_clk <= !spi_clk;
                        else spi_clk <= spi_clk;
                      end
                end
        assign sck = !spi_clk_g;
BUFG clock_g (
              .I   (spi_clk),
              .O   (spi_clk_g)
              );       
//assign    spi_clk_g  = spi_clk;
reg  reg_write,reg_read  ;
always @ (posedge clkin)
        begin
        	if(reset) reg_write <= 1'b0 ;
           else  if(write)   reg_write <= 1'b1;
           else if(true_write) reg_write <= 1'b0;
           else reg_write <= reg_write;
        end

always @ (posedge spi_clk_g)
        begin
                if(reset) true_write <= 1'b0;
                else if(true_write) true_write <= 1'b0;
                else if(reg_write) true_write <= 1'b1;
                else true_write <= true_write;
        end     
//______ judee ______________________________________                      

reg          true_read = 1'b0;
 always @ (posedge clkin)
   begin
   	if(reset) reg_read <= 1'b0 ;
      else  if(read)   reg_read <= 1'b1;
      else if(true_read) reg_read <= 1'b0;
      else reg_read <= reg_read;
   end
always @ (posedge spi_clk_g)
  begin
    if(reset) true_read <= 1'b0;
    else if(true_read) true_read <= 1'b0;
    else if(reg_read) true_read <= 1'b1;
    else true_read <= true_read;
  end
//____________state_____________________________
            
parameter idle     = 2'b00,
          s_write  = 2'b01,
          s_read   = 2'b10;

reg [1  : 0] state = 2'b0;

//______ for 93LC46A wr cmd 3bit/ addr 7bit/ data 8bit
wire [9  : 0] ewen_data = 10'b100_1100000;     
wire [24  : 0] write_data = {3'b101,spi_addr_i[6:0],spi_data_i,7'b1100_100};
//_______ rd cmd 3bit  addr 7bit
wire [9  : 0] write_data_rd = {3'b110,spi_addr_i[6:0]};  

//_______ for 93LC46B wr cmd 3bit/ addr 6bit/ data16bit 
//reg [8  : 0] ewen_data = 9'b100110000;  
//reg [24  : 0] write_data = 25'b100_010000_1010_1111_1100_1001;

//________ wriite all 
//reg [16  : 0] write_data = 17'b101_000010_1010_1101; 
 
//reg [8  : 0] write_data_rd = 9'b110_0000010;//rd cmd 3bit / addr 6bit

reg [15  : 0] read_data; 

reg [5  : 0] wr_state_cnt = 6'b0; 
reg [4  : 0] rd_state_cnt = 5'b0; 
//state
always @ (posedge spi_clk_g)
        begin
                if(reset) state <= idle;
                else
                        case(state)
                        idle:
                                begin
                                if(true_read) state <= s_read;
                                else if(true_write) state <= s_write;
                                end
                    
                        s_read: state <= (rd_state_cnt == 5'd20) ? idle : s_read;
                        s_write: state <= (wr_state_cnt == 6'd31) ? idle : s_write;
                        endcase
        end
//__________wr_state_cnt _________
 always @ (posedge spi_clk_g)
         begin
                 if(reset) wr_state_cnt <= 6'b0;
                 else if(state == s_write) wr_state_cnt <= wr_state_cnt + 1;
                 else wr_state_cnt <= 6'b0;
         end
//_________rd_state_cnt___________
 always @ (posedge spi_clk_g)
         begin
                 if(reset) rd_state_cnt <= 5'b0;
                 else if(state == s_read) rd_state_cnt <= rd_state_cnt + 1;
                 else rd_state_cnt <= 5'b0;
         end
//___________cs______________
        always @ (posedge spi_clk_g)
                begin
                        if(reset) cs <= 1'b0;
                        else if(wr_state_cnt == 6'd1) cs <= 1'b1; 
                        
                         else if(wr_state_cnt == 6'd11) cs <= 1'b0;  
                         else if(wr_state_cnt == 6'd13) cs <= 1'b1;
                         else if(wr_state_cnt == 6'd31) cs <= 1'b0; 
                         else if(rd_state_cnt == 5'd1) cs <= 1'b1; 
                         else if(rd_state_cnt == 5'd20) cs <= 1'b0; 
                        else cs <= cs; 
                end
//___________mo
            always @ (posedge spi_clk_g)
                    begin
                            if(reset) mo <= 1'b0;
                            else if(state == s_write)
                                    begin
                                    case(wr_state_cnt)
                                 
                                    6'd1: mo <= ewen_data[9];//EWEN cmd 
                                    6'd2: mo <= ewen_data[8];        
                                    6'd3: mo <= ewen_data[7];        
                                    6'd4: mo <= ewen_data[6];        
                                    6'd5: mo <= ewen_data[5];        
                                    6'd6: mo <= ewen_data[4];        
                                    6'd7: mo <= ewen_data[3];        
                                    6'd8: mo <= ewen_data[2];        
                                    6'd9: mo <= ewen_data[1];
                                    6'd10: mo <= ewen_data[0];        
                                   
                                    6'd13 : mo <= write_data[24]; 
                                    6'd14 : mo <= write_data[23]; 
                                    6'd15 : mo <= write_data[22]; 
                                    6'd16 : mo <= write_data[21]; 
                                    6'd17 : mo <= write_data[20]; 
                                    6'd18 : mo <= write_data[19]; 
                                    6'd19 : mo <= write_data[18]; 
                                    6'd20 : mo <= write_data[17]; 
                                    6'd21 : mo <= write_data[16];     
                                    6'd22 : mo <= write_data[15];     
                                    6'd23 : mo <= write_data[14];     
                                    6'd24 : mo <= write_data[13];     
                                    6'd25 : mo <= write_data[12];     
                                    6'd26 : mo <= write_data[11];     
                                    6'd27 : mo <= write_data[10];     
                                    6'd28 : mo <= write_data[9];      
                                    6'd29 : mo <= write_data[8];      
                                    6'd30 : mo <= write_data[7];      
                                     
                                    6'd31 : mo <= write_data[5];      
                                    6'd32 : mo <= write_data[4];      
                                    6'd33 : mo <= write_data[3];      
                                    6'd34 : mo <= write_data[2];      
                                    6'd35 : mo <= write_data[1];      
                                    6'd36 : mo <= write_data[0];      
                                    default: mo <= 1'b0;
                                    endcase
                                    end
                            else if(state == s_read) 
                                    begin
                                    case(rd_state_cnt)
                                        5'd1: mo <= write_data_rd[9];//rd
                                        5'd2: mo <= write_data_rd[8];     
                                        5'd3: mo <= write_data_rd[7];     
                                        5'd4: mo <= write_data_rd[6];     
                                        5'd5: mo <= write_data_rd[5];     
                                        5'd6: mo <= write_data_rd[4];     
                                        5'd7: mo <= write_data_rd[3];     
                                        5'd8: mo <= write_data_rd[2];     
                                        5'd9: mo <= write_data_rd[1];
                                        5'd10: mo <= write_data_rd[0];      
                                    endcase
                                    end
                    end
       //mi
            always @ (posedge spi_clk_g)
                    begin
                            if(reset) read_data <= 16'b0;
                            else if(state == s_read)
                                    begin
                                    case(rd_state_cnt)
                                        6'd12  :  read_data[15] <=mi  ;//EEPROM data
                                        6'd13  :  read_data[14] <=mi  ;              
                                        6'd14  :  read_data[13] <=mi  ;              
                                        6'd15  :  read_data[12] <=mi  ;              
                                        6'd16  :  read_data[11] <=mi  ;              
                                        6'd17  :  read_data[10] <=mi  ;              
                                        6'd18  :  read_data[9]  <=mi  ;              
                                        6'd19  :  read_data[8]  <=mi  ;              
                                        6'd20  :  read_data[7]  <=mi  ;              
                                              
                                    endcase
                                    end
                    end

// assign data_out = read_data[15:0];
 assign data_out =  read_data[15:8] ;
 reg [1:0] reg_state;
 reg [4:0] reg_rd_state_cnt;
 always @ (posedge clkin)
    begin
    	if(reset) reg_state <= 2'b0 ;
       else reg_state <=  state;
    end
 always @ (posedge clkin)
    begin
    	if(reset) reg_rd_state_cnt <= 5'b0 ;
       else reg_rd_state_cnt <=  rd_state_cnt;
    end
    //assign rd_done = (reg_rd_state_cnt == 5'd26) && 
   //                              (reg_state == s_read) && (state == idle) ;
     assign rd_done = (reg_rd_state_cnt == 5'd20) && 
                                 (reg_state == s_read) && (state == idle) ; 
endmodule





