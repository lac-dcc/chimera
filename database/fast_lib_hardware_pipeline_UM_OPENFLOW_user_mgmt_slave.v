////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: user_mgmt_slave.v
//Target Device: Altera
//Dscription: 
//  1)parse localbus and alloct address space
//  2)
//  3)
//
//
//
//Author : 
//Revision List:
//	rn1:	date:	modifier:	description:
//	rn2:	date:	modifier:	description:
//

module user_mgmt_slave(
    input clk,
    input rst_n,
//from localbus master
    input localbus_cs_n,
    input localbus_rd_wr,//0 write 1:read
    input [31:0] localbus_data,
    input localbus_ale,
    output localbus_ack_n,
    output [31:0] localbus_data_out,
//to bv lookup
    output cfg2lookup_cs_n,
    output cfg2lookup_rd_wr,
    output [31:0] cfg2lookup_data,
    output cfg2lookup_ale,
    input lookup2cfg_ack_n,
    input [31:0] lookup2cfg_data_out, 
//to rule mgmt
    output reg cfg2rule_cs,//high active
    input rule2cfg_ack,//high active ,handshake with cfg2rule_cs
    output cfg2rule_rw,//0:read 1:write
    output reg [15:0] cfg2rule_addr,
    output [31:0] cfg2rule_wdata,
    input [31:0] rule2cfg_rdata
);
//***************************************************
//        Intermediate variable Declaration
//***************************************************
//all wire/reg/parameter variable 
//should be declare below here 

reg [1:0] ram_state;
reg [31:0] addr_latch;//latch the address when local_ale assert
//***************************************************
//                Address Allocate
//***************************************************
assign localbus_ack_n = lookup2cfg_ack_n && (~rule2cfg_ack);
assign localbus_data_out = (rule2cfg_ack == 1'b1) ? rule2cfg_rdata : lookup2cfg_data_out;
//*******************
//  Lookup Allocate
//*******************
always @(posedge clk) begin
    if(localbus_ale == 1'b1) begin
        addr_latch <= cfg2lookup_data;
    end
    else begin
        addr_latch <= addr_latch;
    end
end

//tell lzn add address space judge logic in his module
assign cfg2lookup_cs_n = (addr_latch[31:20] == 12'd0) ? localbus_cs_n : 1'b1;
assign cfg2lookup_rd_wr = localbus_rd_wr;
assign cfg2lookup_data = localbus_data;
assign cfg2lookup_ale = (cfg2lookup_data[31:20] == 12'd0) ? localbus_ale : 1'b0;


//*******************
//  Ram Allocate
//*******************
assign cfg2rule_rw = ~localbus_rd_wr;
assign cfg2rule_wdata = localbus_data;


localparam  IDLE_S = 2'd0,
            SEND_S = 2'd1,
            RELEASE_S = 2'd2;
            
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        cfg2rule_cs <= 1'b0;
        ram_state <= IDLE_S;
    end
    else begin
        case(ram_state)
            IDLE_S: begin
                cfg2rule_cs <= 1'b0;
                if(localbus_ale == 1'b1) begin
                    if(localbus_data[31:20] == 12'd1) begin//ram address space
                        cfg2rule_addr <= localbus_data[15:0];
                        ram_state <= SEND_S;
                    end
                    else begin
                        ram_state <= IDLE_S;
                    end
                end
                else begin
                    ram_state <= IDLE_S;
                end
            end
            
            SEND_S: begin//wait cfg data
                if(localbus_cs_n == 1'b0) begin
                    cfg2rule_cs <= 1'b1;
                    ram_state <= RELEASE_S;
                end
                else begin
                    cfg2rule_cs <= 1'b0;
                    ram_state <= SEND_S;
                end
            end
            
            RELEASE_S: begin//wait localbus cs&ack handshake over
                if(localbus_cs_n == 1'b0) begin
                    cfg2rule_cs <= 1'b1;
                    ram_state <= RELEASE_S;
                end
                else begin
                    cfg2rule_cs <= 1'b0;
                    ram_state <= IDLE_S;
                end
            end
            
            default: begin
                cfg2rule_cs <= 1'b0;
                ram_state <= IDLE_S;
            end
        endcase
    end
end
      
endmodule

/**********************************
            Initial Inst
      
user_mgmt_slave user_mgmt_slave(
.clk(),
.rst_n(),
//from localbus master
.localbus_cs_n(),
.localbus_rd_wr(),//0 write 1:read
.localbus_data(),
.localbus_ale(),
.localbus_ack_n(),
.localbus_data_out(),
//to bv lookup
.cfg2lookup_cs_n(),
.cfg2lookup_rd_wr(),
.cfg2lookup_data(),
.cfg2lookup_ale(),
.lookup2cfg_ack_n(),
.lookup2cfg_data_out(), 
//to rule mgmt
.cfg2rule_cs(),//high active
.rule2cfg_ack(),//high active,handshake with cfg2rule_cs
.cfg2rule_rw(),//0:read 1:write
.cfg2rule_addr(),
.cfg2rule_wdata(),
.rule2cfg_rdata()
);
**********************************/