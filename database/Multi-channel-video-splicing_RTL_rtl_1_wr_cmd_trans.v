// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Meyesemi
// Engineer: Nill
// 
// Create Date: 29/01/23 14:24:22
// Design Name: 
// Module Name: wr_cmd_trans
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define UD #1
module wr_cmd_trans #(
    parameter                        CTRL_ADDR_WIDTH      = 28,
    parameter                        MEM_DQ_WIDTH         = 16
)  (
    input                            clk,
    input                            rstn,
                                     
    input                            wr_cmd_en,
    input  [CTRL_ADDR_WIDTH-1:0]     wr_cmd_addr,
    input  [31: 0]                   wr_cmd_len,
    output reg                       wr_cmd_ready,
    output reg                       wr_cmd_done,
    input                            wr_bac,  
    input  [MEM_DQ_WIDTH*8-1:0]      wr_ctrl_data,
    output                           wr_data_re,
                                     
    output reg                       wr_en=0,        
    output reg [CTRL_ADDR_WIDTH-1:0] wr_addr=0,      
    output reg [ 3: 0]               wr_id=0,        
    output reg [ 3: 0]               wr_len=0,       
    output reg                       wr_data_en=0,
    output [MEM_DQ_WIDTH*8-1:0]      wr_data,
    input                            wr_ready,
    input                            wr_done,
    
    input                            rd_cmd_en,
    input  [CTRL_ADDR_WIDTH-1:0]     rd_cmd_addr,
    input  [31: 0]                   rd_cmd_len,
    output reg                       rd_cmd_ready=1,
    output reg                       rd_cmd_done=0,
    input                            read_en,
    
    output reg                       rd_en        =0,                 
    output reg [CTRL_ADDR_WIDTH-1:0] rd_addr      =0,           
    output reg [3:0]                 rd_id        =0,           
    output reg [3:0]                 rd_len       =0,           
    input                            rd_done_p     
);

    reg          wr_done_1d;
    reg          wr_cmd_en_1d;
    reg [15:0]   wr_cnt;
    reg          write_enable;
    reg [31:0]   wr_trans_len;
    wire         wr_cmd_trig;
    always @(posedge clk)
    begin
        wr_done_1d <= wr_done;
        wr_cmd_en_1d <= wr_cmd_en;
        
        if(wr_cmd_trig)
            wr_trans_len <= wr_cmd_len;
        else
            wr_trans_len <= wr_trans_len;
    end
    assign  wr_cmd_trig = ~wr_cmd_en_1d & wr_cmd_en;
    
    always @(posedge clk)
    begin
        if(~rstn)
            wr_en <= 1'd0;
        else if(wr_cmd_trig)
            wr_en <= 1'd1;
        else if(wr_cnt < wr_trans_len && (~wr_done_1d && wr_done))
            wr_en <= 1'd1;
        else
            wr_en <= 1'd0;
    end 
    
    always @(posedge clk)
    begin
        if(~rstn)
            write_enable <= 1'd0;
        else if(wr_cmd_trig)
            write_enable <= 1'd1;
        else if(wr_cnt >= wr_trans_len - 16 && (~wr_done_1d && wr_done))
            write_enable <= 1'd0;
        else
            write_enable <= write_enable;
    end 
    
    always @(posedge clk)
    begin
        if(~rstn)
            wr_cnt <= 16'd0;
        else if(wr_cmd_trig)
            wr_cnt <= 16'd16;
        else if(write_enable && (~wr_done_1d && wr_done))
        begin
            if(wr_cnt >= wr_trans_len - 16)
                wr_cnt <= wr_cmd_len;
            else
                wr_cnt <= wr_cnt + 16'd16;
        end
        else
            wr_cnt <= wr_cnt;
    end 

    always @(posedge clk)
    begin
        if(~rstn)
            wr_cmd_done <= 1'd0;
        else
        begin
            if(wr_cnt == wr_trans_len && (~wr_done_1d && wr_done))
                wr_cmd_done <= 1'd1;
            else
                wr_cmd_done <= 1'd0;
        end
    end
      
    always @(posedge clk)
    begin
        if(~rstn)
            wr_cmd_ready <= 1'd1;
        else
        begin
            if(wr_cmd_trig)
                wr_cmd_ready <= 1'd0;
            else if(wr_cmd_done)
                wr_cmd_ready <= 1'd1;
            else
                wr_cmd_ready <= wr_cmd_ready;
        end
    end     
    
    always @(posedge clk)
    begin
        if(~rstn)
        begin
            wr_addr <= {CTRL_ADDR_WIDTH{1'b0}};
            wr_id   <= 'd0;
            wr_len  <= 4'd15;
        end
        else if(wr_cmd_trig)
        begin
            wr_addr <= wr_cmd_addr;
            wr_id   <= 'd0;
            wr_len  <= 4'd15;
        end
        else
        begin
            if(~wr_done_1d && wr_done)
            begin
                if(wr_cnt >= wr_trans_len - 16)  
                    wr_len <= wr_trans_len - wr_cnt - 1'b1;
                else
                    wr_len <= 4'd15;
                    
                wr_addr <= wr_addr + {wr_len,3'd0} + 4'b1000;//12'd1024;
            end 
            else
            begin
//                wr_id   <= wr_id;
                wr_addr <= wr_addr;
            end 
        end 
    end
    
    reg [3:0] burst_cnt ;
    reg       wr_data_re_reg;
    always @(posedge clk)
    begin
        if(~rstn)
            wr_data_re_reg <= 1'b0;
        else if(wr_ready) 
        begin  
            if(burst_cnt == wr_len && wr_data_re_reg)
                wr_data_re_reg <= 1'b0;
            else
                wr_data_re_reg <= 1'b1;
        end 
        else
            wr_data_re_reg <= 1'b0;
    end
    assign wr_data_re = wr_ready;// & wr_data_re_reg;
    
    always @(posedge clk)
    begin
        if(wr_data_re)
            wr_data_en <= 1'b1;
        else 
            wr_data_en <= 1'b0;
    end
    
    always @(posedge clk)
    begin
        if(~rstn)
            burst_cnt <= 1'b0;
        else if(wr_data_re && wr_ready) 
        begin  
            if(burst_cnt == wr_len)
                burst_cnt <= 1'b0;
            else
                burst_cnt <= burst_cnt + 1'b1;
        end
        else if(wr_bac) 
            burst_cnt <= burst_cnt - 1'b1;
        else
            burst_cnt <= burst_cnt;
    end  
    
    assign wr_data = wr_ctrl_data;
    
    //============================================================================
    //  read chanel
    //============================================================================
    reg        read_enable;
    reg [15:0] rd_cnt;
    reg        rd_done_1d;
    reg        rd_cmd_en_1d;
    reg [31:0] rd_trans_len;
    wire       rd_cmd_trig;
    assign rd_cmd_trig = ~rd_cmd_en_1d & rd_cmd_en;
    always @(posedge clk)
    begin
        rd_done_1d <= rd_done_p;
        rd_cmd_en_1d <= rd_cmd_en;
        if(rd_cmd_trig)
            rd_trans_len <= rd_cmd_len;
        else
            rd_trans_len <= rd_trans_len;
            
            
        if(~rstn)
            read_enable <= 1'b0;
        else if(rd_cmd_trig)
            read_enable <= 1'b1;
        else if(rd_cnt >= rd_trans_len - 16 && (~rd_done_1d && rd_done_p))
            read_enable <= 1'b0;
        else
            read_enable <= read_enable;
    end 
    
    reg read_enable_1d;
    
    always @(posedge clk)
    begin
        read_enable_1d <= read_enable;
        
        if(~rstn)
            rd_en <= 1'd0;
        else if(~read_enable_1d && read_enable)
            rd_en <= 1'd1;
        else if(rd_cnt < rd_trans_len && (~rd_done_1d && rd_done_p))
            rd_en <= 1'd1;
        else
            rd_en <= 1'd0;
    end 
    
    reg [15:0] rd_data_cnt;
    always @(posedge clk)
    begin
        if(~rstn)
            rd_data_cnt <= 1'd0; 
        else if(rd_cmd_trig)
            rd_data_cnt <= 1'd0;
        else if(read_en)
        begin
            if(rd_data_cnt == rd_trans_len - 1'b1)
                rd_data_cnt <= 1'd0; 
            else
                rd_data_cnt <= rd_data_cnt + 1'd1; 
        end
        else
            rd_data_cnt <= rd_data_cnt; 
    end
    
    always @(posedge clk)
    begin
        if(~rstn)
            rd_cmd_done <= 1'd0;
        else
        begin
            if(rd_data_cnt == rd_trans_len - 1'b1)
                rd_cmd_done <= 1'd1;
            else
                rd_cmd_done <= 1'd0;
        end
    end
      
    always @(posedge clk)
    begin
        if(~rstn)
            rd_cmd_ready <= 1'd1;
        else
        begin
            if(rd_cmd_trig)
                rd_cmd_ready <= 1'd0;
            else if(rd_cnt == rd_trans_len && (~rd_done_1d && rd_done_p))
                rd_cmd_ready <= 1'd1;
            else
                rd_cmd_ready <= rd_cmd_ready;
        end
    end
    
    always @(posedge clk)
    begin
        if(~rstn)
            rd_cnt <= 16'd0;
        else if(~read_enable_1d && read_enable)
            rd_cnt <= 16'd16;
        else if(read_enable && (~rd_done_1d && rd_done_p))
        begin
            if(rd_cnt >= rd_cmd_len - 16)  
                rd_cnt <= rd_cmd_len;
            else
                rd_cnt <= rd_cnt + 16'd16;
        end
        else
            rd_cnt <= rd_cnt;
    end 
    
    always @(posedge clk)
    begin
        if(~rstn)
        begin
            rd_addr <= {CTRL_ADDR_WIDTH{1'b0}};
            rd_id   <= 'd0;
            rd_len  <= 4'd15;
        end
        else if(~read_enable_1d && read_enable)
        begin
            rd_addr <= rd_cmd_addr;
            rd_id   <= 'd0;
            rd_len  <= 4'd15;
        end
        else
        begin
            if(~rd_done_1d && rd_done_p)
            begin
                if(rd_cnt >= rd_cmd_len - 16)  
                    rd_len <= rd_cmd_len - rd_cnt - 1'b1;
                else
                    rd_len <= 4'd15;

                rd_addr <= rd_addr + {rd_len,3'd0} + 4'b1000;//12'd1024;
            end 
            else
            begin
                rd_addr <= rd_addr;
            end 
        end 
    end
    
endmodule
