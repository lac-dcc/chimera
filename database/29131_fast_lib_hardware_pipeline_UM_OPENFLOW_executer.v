// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: executer.v
//Target Device: Altera
//Dscription: 
//  1)store pkt waiting for rule
//  2)process pkt as rule
//  3)just achieve judge forwarding direction at now

//  pkt type:
//      pkt_site    2bit    :   2'b01 pkt head / 2'b11 pkt body / 2'b10 pkt tail
//      invalid     4bit    :   the invalid byte sum of every payload cycle
//      payload     128bit  :   pkt payload
//
//
//  rule type:
//      ctrl        24bit  :    [31:28]:forwarding direction
//                                  0 discard
//                                  1 trans to CPU with thread id assignd by user /
//                                  2 trans to CPU with polling thread id /
//                                  3 trans to port 
//      port_id     8bit   :    outport id or thread id
//   
//Author : 
//Revision List:
//	rn1:	
//      date:	2016/10/10
//      modifier:	lxj
//      description:    delay rule_fifo_rd 1 cycle,for hold exe2disp_direction don't change 
//                      until next module receive the pkt write enable
//	rn2: 
//      date: 2016/10/11
//      modifier: lxj
//      description: CDP need slotid except outport number(metadata difne) but Software don't give ,so this module act a translator
//                   CDP Metedata: 8port is  (slot 0,bitmap_port 1 2 4 8),(slot 1, bitmap_port 1 2 4 8)   metadata's define can see <<SDN CDP User Define>>
//                   Software: 8port is (bitmap_port 1 2 4 8 10 20 40 80)
//
module executer(
    input clk,
    input rst_n,
    
    input [5:0] sys_max_cpuid,
//pkt waiting for rule
    input parser2exe_data_wr,
    input [133:0] parser2exe_data,
    output exe2parser_alf,  
//rule from lookup engine(BV_search_engine)
    input lookup2exe_rule_wr,
    input [31:0] lookup2exe_rule,
//execute's tranmit direction request
    output exe2disp_direction_req,
    output exe2disp_direction,//0:up cpu  1: down port 
//transmit to next module(dispatch)
    output reg exe2disp_data_wr,
    output reg [133:0] exe2disp_data,
    output reg exe2disp_valid_wr,
    output exe2disp_valid,
    input disp2exe_alf
);    
//***************************************************
//        Intermediate variable Declaration
//***************************************************
//all wire/reg/parameter variable 
//should be declare below here 
reg exe_dfifo_rd;
wire [133:0] exe_dfifo_rdata;
wire [7:0] exe_dfifo_usedw;

reg rule_fifo_rd;
reg rule_fifo_rd_dly;

wire [31:0] rule_fifo_rdata;
wire rule_fifo_empty;

reg [5:0] polling_cpuid;//polling cpuid if rule ctrl is trans to CPU with polling thread id 
reg [1:0] exe_state;

//***************************************************
//                 Stream Judge
//***************************************************
assign exe2disp_valid = exe2disp_valid_wr;
assign exe2parser_alf = exe_dfifo_usedw[7];

assign exe2disp_direction_req = (rule_fifo_empty == 1'b0);
//when rule fifo have data(at least a rule),and not a discard rule
//so the rule fifo must be a showahead mode
assign exe2disp_direction = (rule_fifo_rdata[31:28] == 4'd3) ? 1'b1 : 1'b0;
////0:up cpu  1: down port ,don't care discard,because exe2disp_direction_req will 
//be invalid if rule_fifo_rdata[31:28] is discard rule

localparam  IDLE_S = 2'd0,
            METADATA_S = 2'd1,
            TRANS_S = 2'd2,
            DISCARD_S = 2'd3;

always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        exe_dfifo_rd <= 1'b0;
        rule_fifo_rd <= 1'b0;
        exe2disp_data_wr <= 1'b0;
        exe2disp_valid_wr <= 1'b0;
        polling_cpuid <= 6'b0;
        exe_state <= IDLE_S;
    end
    else begin
        case(exe_state)
            IDLE_S: begin
                exe2disp_data_wr <= 1'b0;
                exe2disp_valid_wr <= 1'b0;
                if((rule_fifo_empty == 1'b0) && (disp2exe_alf == 1'b0)) begin
                //have a rule & next module can receive pkt
                    exe_dfifo_rd <= 1'b1;
                    rule_fifo_rd <= 1'b1;
                    exe_state <= METADATA_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b0;
                    rule_fifo_rd <= 1'b0;
                    exe_state <= IDLE_S;
                end
            end
            
            METADATA_S: begin
                rule_fifo_rd <= 1'b0;
                case(rule_fifo_rdata[31:28])
                    4'd1: begin//1 trans to CPU with thread id assignd by user
                        exe2disp_data_wr <= 1'b1;
                        exe2disp_data[133:56] <= exe_dfifo_rdata[133:56];
                        exe2disp_data[55:47] <= {1'b0,rule_fifo_rdata[7:0]};
                        exe2disp_data[46:0] <= exe_dfifo_rdata[46:0];
                        exe_state <= TRANS_S;
                    end
                    
                    4'd2: begin//2 trans to CPU with polling thread id
                        exe2disp_data_wr <= 1'b1;
                        exe2disp_data[133:56] <= exe_dfifo_rdata[133:56];
                        exe2disp_data[55:47] <= {3'b0,polling_cpuid};
                        exe2disp_data[46:0] <= exe_dfifo_rdata[46:0];
                        if((polling_cpuid+6'b1) < sys_max_cpuid) begin
                        //if use sys_max_cpuid -1,maybe underflow
                            polling_cpuid <= polling_cpuid + 6'd1;
                        end
                        else begin
                            polling_cpuid <= 6'b0;
                        end
                        exe_state <= TRANS_S;
                    end
                    
                    4'd3: begin//3 trans to port 
                        exe2disp_data_wr <= 1'b1;
                        //modify by lxj 20161011 start
                        exe2disp_data[133:113] <= exe_dfifo_rdata[133:113];
                        exe2disp_data[109:74] <= exe_dfifo_rdata[109:74];
                        if(rule_fifo_rdata[7:4] == 4'b0) begin//slot0
                            exe2disp_data[112:110] <= 3'b0;
                            exe2disp_data[73:64] <= {6'b0,rule_fifo_rdata[3:0]};
                        end
                        else begin//slot1
                            exe2disp_data[112:110] <= 3'b1;
                            exe2disp_data[73:64] <= {6'b0,rule_fifo_rdata[7:4]};
                        end
                        //modify by lxj 20161011 end
                        //exe2disp_data[73:64] <= {2'b0,rule_fifo_rdata[7:0]};
                        exe2disp_data[63:0] <= exe_dfifo_rdata[63:0];
                        exe_state <= TRANS_S;
                    end
                    
                    default: begin//discard
                        exe2disp_data_wr <= 1'b0;
                        exe_state <= DISCARD_S;
                    end
                endcase
            end
            
            TRANS_S: begin
                exe2disp_data_wr <= 1'b1;
                exe2disp_data <= exe_dfifo_rdata;
                if(exe_dfifo_rdata[133:132] == 2'b10) begin//end of pkt
                    exe_dfifo_rd <= 1'b0;
                    exe2disp_valid_wr <= 1'b1;
                    exe_state <= IDLE_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b1;
                    exe2disp_valid_wr <= 1'b0;
                    exe_state <= TRANS_S;
                end
            end
            
            DISCARD_S: begin
                rule_fifo_rd <= 1'b0;
                exe2disp_data_wr <= 1'b0;
                if(exe_dfifo_rdata[133:132] == 2'b10) begin//end of pkt
                    exe_dfifo_rd <= 1'b0;
                    exe_state <= IDLE_S;
                end
                else begin
                    exe_dfifo_rd <= 1'b1;
                    exe_state <= DISCARD_S;
                end
            end
            
            default: begin
                exe_dfifo_rd <= 1'b0;
                rule_fifo_rd <= 1'b0;
                exe2disp_data_wr <= 1'b0;
                exe2disp_valid_wr <= 1'b0;
                polling_cpuid <= 6'b0;
                exe_state <= IDLE_S;
            end
        endcase
    end
end

always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        rule_fifo_rd_dly <= 1'b0;
    end
    else begin
        rule_fifo_rd_dly <= rule_fifo_rd;
    end
end
//***************************************************
//                  Other IP Instance
//***************************************************
//likely fifo/ram/async block.... 
//should be instantiated below here 

fifo_256_134 exe_dfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(parser2exe_data_wr),
    .data(parser2exe_data),
    .rdreq(exe_dfifo_rd),
    .q(exe_dfifo_rdata),
    .usedw(exe_dfifo_usedw)
);

rulefifo_64_32 rule_fifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(lookup2exe_rule_wr),
    .data(lookup2exe_rule),
    .rdreq(rule_fifo_rd_dly),
    .q(rule_fifo_rdata),
    .empty(rule_fifo_empty)
);

endmodule

/**********************************
            Initial Inst
      
executer executer(
.clk(),
.rst_n(),
    
.sys_max_cpuid(),
//pkt waiting for rule
.parser2exe_data_wr(),
.parser2exe_data(),
.exe2parser_alf(),  
//rule from lookup engine(BV_search_engine)
.lookup2exe_rule_wr(),
.lookup2exe_rule(),
//execute's tranmit direction request
.exe2disp_direction_req(),
.exe2disp_direction(),//0:up cpu  1: down port 
//transmit to next module(dispatch)
.exe2disp_data_wr(),
.exe2disp_data(),
.exe2disp_valid_wr(),
.exe2disp_valid(),
.disp2exe_alf()
); 

**********************************/  
    