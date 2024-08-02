// This program was cloned from: https://github.com/MongooseOrion/FPGA-Image-Recognition
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Meyesemi
// Engineer: Nill
// 
// Create Date: 07/01/23 17:29:29
// Design Name: 
// Module Name: rd_ctrl
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

module rd_ctrl #(
    parameter CTRL_ADDR_WIDTH      = 28,
    parameter MEM_DQ_WIDTH         = 16 
)(
    input                                clk           ,
    input                                rst_n         ,   
    
    input [CTRL_ADDR_WIDTH-1:0]          read_addr     ,
    input [3:0]                          read_id       ,
    input [3:0]                          read_len      ,
    input                                read_en       ,
    output reg                           read_done_p   =0,
    
    input                                read_ready    ,
    output   [MEM_DQ_WIDTH*8-1:0]        read_rdata    ,
    output                               read_rdata_en ,
   
    output reg [CTRL_ADDR_WIDTH-1:0]     axi_araddr    =0,    
    output reg [3:0]                     axi_arid      =0,
    output reg [3:0]                     axi_arlen     =0,
    output     [2:0]                     axi_arsize    ,
    output     [1:0]                     axi_arburst   ,
    output reg                           axi_arvalid   =0, 
    input                                axi_arready   ,      //only support 2'b01: INCR
                                         
    output                               axi_rready    ,
    input   [MEM_DQ_WIDTH*8-1:0]         axi_rdata     ,
    input                                axi_rvalid    ,
    input                                axi_rlast     ,
    input   [3:0]                        axi_rid       ,
    input   [1:0]                        axi_rresp  
);

    localparam E_IDLE = 3'd0;
    localparam E_RD   = 3'd1;
    localparam E_END  = 3'd2;
    localparam DQ_NUM = MEM_DQ_WIDTH/8; 
    
    assign axi_arburst = 2'b01;
    assign axi_arsize = 3'b110;
    
    reg [2:0] test_rd_state;
    reg [3:0] rd_delay_cnt;

    always @(posedge clk or negedge rst_n)
    begin
       if (!rst_n)
       test_rd_state  <= E_IDLE;
       else begin      
        case (test_rd_state)
            E_IDLE: begin
                if (read_en)
                    test_rd_state <= E_RD;
            end
            E_RD: begin                
                if (axi_arvalid&axi_arready)//(rd_delay_cnt == 4'd7)//
                    test_rd_state <= E_END;
            end
            E_END:  begin
                if (rd_delay_cnt == 4'd15)
                    test_rd_state <= E_IDLE;
            end 
            default:  test_rd_state <= E_IDLE;
        endcase     
       end
    end        
    
    
    always @(posedge clk or negedge rst_n)
    begin
       if (!rst_n)
           rd_delay_cnt       <= 4'b0; 
       else if((test_rd_state == E_END))
           rd_delay_cnt <= rd_delay_cnt + 1'b1;
       else
           rd_delay_cnt       <= 4'b0; 
    end
    
    always @(posedge clk or negedge rst_n)
    begin
       if (!rst_n) begin
           axi_araddr     <= {CTRL_ADDR_WIDTH{1'b0}}; 
           axi_arid       <= 4'b0; 
           axi_arlen      <= 4'b0; 
       end
       else if((test_rd_state == E_IDLE) & read_en)
       begin
           axi_arid <= read_id;
           axi_araddr <= read_addr;
           axi_arlen  <=  read_len;              
       end
    end
    
    always @(posedge clk or negedge rst_n)
    begin
    	if (!rst_n) begin
            axi_arvalid    <= 1'b0; 
            read_done_p    <= 1'b0;
    	end
    	else begin
        	case (test_rd_state)
                E_IDLE: begin
                    read_done_p <= 1'b0 ;
                    axi_arvalid <= 1'b0;
                end
                E_RD: begin
                    axi_arvalid <= 1'b1;   
                                   
                    if (axi_arvalid&axi_arready)
                        axi_arvalid <= 1'b0; 
                end
                E_END: begin
                    axi_arvalid <= 1'b0;
                    if(rd_delay_cnt == 4'd15)
                        read_done_p <= 1'b1;
                end
                default: begin
                    axi_arvalid <= 1'b0;
                    read_done_p <= 1'b0;
                end
            endcase  
    	end
    end

    assign axi_ready = read_ready;
    assign read_rdata = axi_rdata;
    assign read_rdata_en = axi_rvalid;
    assign axi_rready = 1'b1;
 
endmodule  
                
