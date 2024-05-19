// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: UM.v
//Target Device: Altera
//Dscription: 
//  1)user difine module
//  2)a sdn network demo
//  pkt type:
//      pkt_site    2bit    :   2'b01 pkt head / 2'b11 pkt body / 2'b10 pkt tail
//      invalid     4bit    :   the invalid byte sum of every payload cycle
//      payload     128bit  :   pkt payload
//
//  rule type:
//      ctrl        24bit  :    [31:29]:forwarding direction
//                                  0 discard
//                                  1 trans to CPU with thread id assignd by user /
//                                  2 trans to CPU with polling thread id /
//                                  3 trans to port 
//      port_id     8bit   :    outport id or thread id
//
//
//Author : 
//Revision List:
//	rn1:	date:	modifier:	description:
//	rn2:	date:	modifier:	description:
//
module UM(
    input clk,
    input rst_n,
    
    input [5:0] sys_max_cpuid,
//cdp
    input cdp2um_data_wr,
    input [133:0] cdp2um_data,
    input cdp2um_valid_wr,
    input cdp2um_valid,
    output um2cdp_alf,

    output um2cdp_data_wr,
    output [133:0] um2cdp_data,
    output um2cdp_valid_wr,
    output um2cdp_valid,
    input cdp2um_alf,
//npe
    input npe2um_data_wr,
    input [133:0] npe2um_data,
    input npe2um_valid_wr,
    input npe2um_valid,
    output um2npe_alf,

    output um2npe_data_wr,
    output [133:0] um2npe_data,
    output um2npe_valid_wr,
    output um2npe_valid,
    input npe2um_alf,
//localbus
    input localbus_cs_n,
    input localbus_rd_wr,
    input [31:0] localbus_data,
    input localbus_ale,
    output localbus_ack_n,
    output [31:0]  localbus_data_out
);

wire slave2lookup_cs_n;
wire slave2lookup_rd_wr;
wire [31:0] slave2lookup_data;
wire slave2lookup_ale;
wire lookup2slave_ack_n;
wire [31:0] lookup2slave_data_out; 
//to rule mgmt
wire slave2rule_cs;//high active
wire rule2slave_ack;//high active ;handshake with slave2rule_cs
wire slave2rule_rw;//0:read 1:write
wire [15:0] slave2rule_addr;
wire [31:0] slave2rule_wdata;
wire [31:0]rule2slave_rdata;

wire parser2lookup_key_wr;
wire [287:0] parser2lookup_key;

wire parser2exe_data_wr;
wire [133:0] parser2exe_data;
wire exe2parser_alf;


wire lookup2rule_index_wr;
wire [5:0] lookup2rule_index;
wire rule2exe_data_wr;//index read return valid
wire [31:0] rule2exe_data;

wire exe2disp_direction_req;
wire exe2disp_direction;//0:up cpu  1: down port 

wire exe2disp_data_wr;
wire [133:0] exe2disp_data;
wire exe2disp_valid_wr;
wire exe2disp_valid;
wire disp2exe_alf;

wire disp2usermux_data_wr;
wire [133:0] disp2usermux_data;
wire disp2usermux_valid_wr;
wire disp2usermux_valid;
wire usermux2disp_alf;

user_mgmt_slave user_mgmt_slave(
.clk(clk),
.rst_n(rst_n),
//from localbus master
.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),//0 write 1:read
.localbus_data(localbus_data),
.localbus_ale(localbus_ale),
.localbus_ack_n(localbus_ack_n),
.localbus_data_out(localbus_data_out),
//to bv lookup
.cfg2lookup_cs_n(slave2lookup_cs_n),
.cfg2lookup_rd_wr(slave2lookup_rd_wr),
.cfg2lookup_data(slave2lookup_data),
.cfg2lookup_ale(slave2lookup_ale),
.lookup2cfg_ack_n(lookup2slave_ack_n),
.lookup2cfg_data_out(lookup2slave_data_out), 
//to rule mgmt
.cfg2rule_cs(slave2rule_cs),//high active
.rule2cfg_ack(rule2slave_ack),//high active,handshake with cfg2rule_cs
.cfg2rule_rw(slave2rule_rw),//0:read 1:write
.cfg2rule_addr(slave2rule_addr),
.cfg2rule_wdata(slave2rule_wdata),
.rule2cfg_rdata(rule2slave_rdata)
);

parser parser(
.clk(clk),
.rst_n(rst_n),
    
//input pkt from port
.port2parser_data_wr(cdp2um_data_wr),
.port2parser_data(cdp2um_data),
.port2parser_valid_wr(cdp2um_valid_wr),
.port2parser_valid(cdp2um_valid),
.parser2port_alf(um2cdp_alf),
//parse key which transmit to lookup
.parser2lookup_key_wr(parser2lookup_key_wr),
.parser2lookup_key(parser2lookup_key),
//transport to next module
.parser2next_data_wr(parser2exe_data_wr),
.parser2next_data(parser2exe_data),
.next2parser_alf(exe2parser_alf)
);

lookup BV_Search_engine(
    .clk(clk),
    .reset(rst_n),//low active
    
    .localbus_cs_n(slave2lookup_cs_n),
    .localbus_rd_wr(slave2lookup_rd_wr),//0 write 1:read
    .localbus_data(slave2lookup_data),
    .localbus_ale(slave2lookup_ale),
    .localbus_ack_n(lookup2slave_ack_n),
    .localbus_data_out(lookup2slave_data_out),
    
    .metadata_valid(parser2lookup_key_wr),
    .metadata(parser2lookup_key),
    
    .countid_valid(lookup2rule_index_wr),
    .countid(lookup2rule_index)//6bit width?
);


rule_access rule_access(
    .clk(clk),
    .rst_n(rst_n),
    //lookup rule read index
    .lookup2rule_index_wr(lookup2rule_index_wr),
    .lookup2rule_index({10'b0,lookup2rule_index}),//16bit width
    .rule2lookup_data_wr(rule2exe_data_wr),//index read return valid
    .rule2lookup_data(rule2exe_data),
    //user cfg require
    .cfg2rule_cs(slave2rule_cs),//high active
    .rule2cfg_ack(rule2slave_ack),//high active,handshake with cfg2rule_cs
    .cfg2rule_rw(slave2rule_rw),//0:read 1:write
    .cfg2rule_addr(slave2rule_addr),
    .cfg2rule_wdata(slave2rule_wdata),
    .rule2cfg_rdata(rule2slave_rdata)
);

executer executer(
    .clk(clk),
    .rst_n(rst_n),
        
    .sys_max_cpuid(sys_max_cpuid),
    //pkt waiting for rule
    .parser2exe_data_wr(parser2exe_data_wr),
    .parser2exe_data(parser2exe_data),
    .exe2parser_alf(exe2parser_alf),  
    //rule from lookup engine(BV_search_engine)
    .lookup2exe_rule_wr(rule2exe_data_wr),
    .lookup2exe_rule(rule2exe_data),
    //execute's tranmit direction request
    .exe2disp_direction_req(exe2disp_direction_req),
    .exe2disp_direction(exe2disp_direction),//0:up cpu  1: down port 
    //transmit to next module(dispatch)
    .exe2disp_data_wr(exe2disp_data_wr),
    .exe2disp_data(exe2disp_data),
    .exe2disp_valid_wr(exe2disp_valid_wr),
    .exe2disp_valid(exe2disp_valid),
    .disp2exe_alf(disp2exe_alf)
); 
    
dispatch dispatch(
    .clk(clk),
    .rst_n(rst_n),
    //execute module's pkt waiting for transmit
    .exe2disp_data_wr(exe2disp_data_wr),
    .exe2disp_data(exe2disp_data),
    .exe2disp_valid_wr(exe2disp_valid_wr),
    .exe2disp_valid(exe2disp_valid),
    .disp2exe_alf(disp2exe_alf),
    //execute's tranmit direction request
    .exe2disp_direction_req(exe2disp_direction_req),
    .exe2disp_direction(exe2disp_direction),//0:up cpu  1: down port 
    //transmit to up cpu
    .disp2up_data_wr(um2npe_data_wr),
    .disp2up_data(um2npe_data),
    .disp2up_valid_wr(um2npe_valid_wr),
    .disp2up_valid(um2npe_valid),
    .up2disp_alf(npe2um_alf),
    //transmit to down port
    .disp2down_data_wr(disp2usermux_data_wr),
    .disp2down_data(disp2usermux_data),
    .disp2down_valid_wr(disp2usermux_valid_wr),
    .disp2down_valid(disp2usermux_valid),
    .down2disp_alf(usermux2disp_alf)
);

user_mux user_mux(
    .clk(clk),
    .rst_n(rst_n),
    //lookup pkt waiting for transmit
    .disp2usermux_data_wr(disp2usermux_data_wr),
    .disp2usermux_data(disp2usermux_data),
    .disp2usermux_valid_wr(disp2usermux_valid_wr),
    .disp2usermux_valid(disp2usermux_valid),
    .usermux2disp_alf(usermux2disp_alf),
    //up cpu pkt waiting for transmit
    .up2usermux_data_wr(npe2um_data_wr),
    .up2usermux_data(npe2um_data),
    .up2usermux_valid_wr(npe2um_valid_wr),
    .up2usermux_valid(npe2um_valid),
    .usermux2up_alf(um2npe_alf),
    //transmit to down port
    .usermux2down_data_wr(um2cdp_data_wr),
    .usermux2down_data(um2cdp_data),
    .usermux2down_valid_wr(um2cdp_valid_wr),
    .usermux2down_valid(um2cdp_valid),
    .down2usermux_alf(cdp2um_alf)
);

endmodule

/**********************************
            Initial Inst
UM UM(
.clk();
.rst_n();
    
.sys_max_cpuid();
//cdp
.cdp2um_data_wr();
.cdp2um_data();
.cdp2um_valid_wr();
.cdp2um_valid();
.um2cdp_alf();

.um2cdp_data_wr();
.um2cdp_data();
.um2cdp_valid_wr();
.um2cdp_valid();
.cdp2um_alf();
//npe
.npe2um_data_wr();
.npe2um_data();
.npe2um_valid_wr();
.npe2um_valid();
.um2npe_alf();

.um2npe_data_wr();
.um2npe_data();
.um2npe_valid_wr();
.um2npe_valid();
.npe2um_alf();
//localbus
.localbus_cs_n();
.localbus_rd_wr();
.localbus_data();
.localbus_ale();
.localbus_ack_n();
.localbus_data_out()
);

**********************************/
