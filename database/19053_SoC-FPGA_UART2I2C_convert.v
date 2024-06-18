// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*********************************************************************
//* ASIC Fresh Board                                                   *
//*  UART2I2C                                                         *
//*  Top File : convert.v                                             *
//*  Author: abdelazeem                                               *
//*  Revision 0.1                                                     *
//*  Date     2023/12/1                                               *
//*  Email : a.abdelazeem201@gmail.com                                * 
//*********************************************************************
`timescale 1ns/1ns

module convert(
	clk50M,
	rst_n,
	rddata,
	RW_Done,
	ack,
	address,
	cmd_data,
	num_cmd,
	cmdvalid,
	
	eeprom_rddata,	
	wrdata,
	wrreg_req,
	rdreg_req,
	addr,
	eeprom_rd_done,
	eeprom_wr_done
	);

	 input clk50M;
    input rst_n;
	 input [7:0]rddata;
	 input RW_Done;
	 input ack;
	 input [15:0]address;
	 input [127:0]cmd_data;
	 input [7:0]num_cmd;
	 input cmdvalid;
	 
	 output reg[127:0]eeprom_rddata;	 
	 output reg[7:0]wrdata;
	 output reg wrreg_req;
	 output reg rdreg_req;
	 output reg[15:0]addr;
	 output reg eeprom_rd_done;
	 output reg eeprom_wr_done;

    reg eeprom_rd_err,eeprom_wr_err;
       
	 reg [2:0]state;
    reg [6:0]data_cnt;		 
	 
    localparam 
        IDLE = 0,
        DO_WR = 1,
        WAIT_WR_DONE  = 2,
        DO_RD = 3,
        WAIT_RD_DONE = 4;
        
    always@(posedge clk50M or negedge rst_n)
    if(!rst_n)begin
        state <= IDLE;
        wrreg_req <= 1'd0;
        addr <= 16'd0;
        wrdata <= 8'd0;
        data_cnt <= 7'd0;
        eeprom_wr_err <= 1'd0;
        eeprom_wr_done <= 1'd0;   
        eeprom_rd_done <= 1'd0;
        eeprom_rd_err <= 1'd0;
        rdreg_req <= 1'd0;   
        eeprom_rddata <= 128'd0;
    end
    else begin
    case(state)
        IDLE:
            begin
                wrreg_req <= 1'd0;
                addr <= 16'd0;
                wrdata <= 8'd0;
                data_cnt <= 7'd0;
                eeprom_wr_err <= 1'd0;   
                eeprom_rd_done <= 1'd0;
                eeprom_rd_err <= 1'd0;
                rdreg_req <= 1'd0;   
                if(cmdvalid && !num_cmd[7])
                    state <= DO_WR;
                else if(cmdvalid && num_cmd[7])begin
                    state <= DO_RD;
                    eeprom_rddata <= 128'd0;
                end
                else
                    state <= IDLE;
            end
                
        DO_WR:
            begin
                wrreg_req <= 1'd1;
                addr <= data_cnt + address;
                state <= WAIT_WR_DONE;
                case(data_cnt)
                    0:wrdata <= cmd_data[127:120];
                    1:wrdata <= cmd_data[119:112];
                    2:wrdata <= cmd_data[111:104];
                    3:wrdata <= cmd_data[103:96];
                    4:wrdata <= cmd_data[95:88];
                    5:wrdata <= cmd_data[87:80];
                    6:wrdata <= cmd_data[79:72];
                    7:wrdata <= cmd_data[71:64];
                    8:wrdata <= cmd_data[63:56];
                    9:wrdata <= cmd_data[55:48];
                    10:wrdata <= cmd_data[47:40];
                    11:wrdata <= cmd_data[39:32];
                    12:wrdata <= cmd_data[31:24];
                    13:wrdata <= cmd_data[23:16];
                    14:wrdata <= cmd_data[15:8];
                    15:wrdata <= cmd_data[7:0];
                    default:wrdata <= 0;
                endcase
            end
            
        WAIT_WR_DONE:
            begin
                wrreg_req <= 1'd0;
                if(RW_Done)begin
                    if(!ack)begin  
                        if(data_cnt >= num_cmd - 1)begin
                            state <= IDLE;
                            eeprom_wr_done <= 1'd1;
                            data_cnt <= 0;
                        end
                        else begin
                            state <= DO_WR;
                            data_cnt <= data_cnt + 1'd1;    
                        end           
                    end
                    else begin  
                        state <= IDLE;
                        eeprom_wr_err <= 1'd1;                 
                    end
                end
                else begin
                    state <= WAIT_WR_DONE;
                    data_cnt <= data_cnt;
                end
            end

        DO_RD:
            begin
                rdreg_req <= 1'd1;
                state <= WAIT_RD_DONE;
                addr <= data_cnt + address;
            end  
                      
        WAIT_RD_DONE:
            begin
                rdreg_req <= 1'd0;
                if(RW_Done)begin
                    if(!ack)begin   
                        case(data_cnt)
                            0:eeprom_rddata[127:120] <= rddata;
                            1:eeprom_rddata[119:112] <= rddata;
                            2:eeprom_rddata[111:104] <= rddata;
                            3:eeprom_rddata[103:96] <= rddata;
                            4:eeprom_rddata[95:88] <= rddata;
                            5:eeprom_rddata[87:80] <= rddata;
                            6:eeprom_rddata[79:72] <= rddata;
                            7:eeprom_rddata[71:64] <= rddata;
                            8:eeprom_rddata[63:56] <= rddata;
                            9:eeprom_rddata[55:48] <= rddata;
                            10:eeprom_rddata[47:40] <= rddata;
                            11:eeprom_rddata[39:32] <= rddata;
                            12:eeprom_rddata[31:24] <= rddata;
                            13:eeprom_rddata[23:16] <= rddata;
                            14:eeprom_rddata[15:8] <= rddata;
                            15:eeprom_rddata[7:0] <= rddata;
                            default:;
                        endcase
                        if(data_cnt >= (num_cmd & 8'h7F) - 1)begin
                            state <= IDLE;
                            eeprom_rd_done <= 1'd1;
                            data_cnt <= 0;
                        end
                        else begin
                            state <= DO_RD;
                            data_cnt <= data_cnt + 1'd1;    
                        end           
                    end
                    else begin 
                        state <= IDLE;
                        eeprom_rd_err <= 1'd1;                 
                    end
                end
                else begin
                    state <= WAIT_RD_DONE;
                    data_cnt <= data_cnt;
                end
            end
            
            default:state <= IDLE;
        endcase
    end         

endmodule
