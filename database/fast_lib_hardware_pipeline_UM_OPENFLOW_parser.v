////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: parser.v
//Target Device: Altera
//Dscription: 
//  1)receive & parse 9 tuple from pkt
//  2)retransmit pkt to next module after parsed all key field
//  3)only support ipv4 
//
//  pkt type:
//      pkt_site    2bit    :   2'b01 pkt head / 2'b11 pkt body / 2'b10 pkt tail
//      invalid     4bit    :   the invalid byte sum of every payload cycle
//      payload     128bit  :   pkt payload
//
//
//  9tuple struct: {
//      SMAC        48bit   :   source mac address
//      DMAC        48bit   :   destination mac address
//      ETH_TYPE    16bit   :   ethernet head's next layer type field
//      SIP         32bit   :   source ip address
//      DIP         32bit   :   destination ip address
//      IP_PROTO    8bit    :   ipv4 head's next layer protocol field
//      SPORT       16bit   :   source port(tcp or udp can be judged by IP_PROTO)
//      DPORT       16bit   :   destination port(tcp or udp can be judged by IP_PROTO)
//      INPORT      8bit    :   inport number
//      RSV         64bit   :   reserve field,must set all bit to 1
//  }    
//  
//Author : 
//Revision List:
//	rn1: 
//      date: 2016/10/09
//      modifier: lxj
//      description: rearrange 9tuple's struct for adapt software difine
//	rn2: 
//      date: 2016/10/11
//      modifier: lxj
//      description: inport in metadata is orgnize by slotid+inportnumber, old code just use inportnumber
//	rn3:	date:	modifier:	description:
//
module parser(
    input clk,
    input rst_n,
    
//input pkt from port
    input port2parser_data_wr,
    input [133:0] port2parser_data,
    input port2parser_valid_wr,
    input port2parser_valid,
    output parser2port_alf,
//parse key which transmit to lookup
    output reg parser2lookup_key_wr,
    output [287:0] parser2lookup_key,
//transport to next module
    output parser2next_data_wr,
    output [133:0] parser2next_data,
    input next2parser_alf
);
//***************************************************
//        Intermediate variable Declaration
//***************************************************
//all wire/reg/parameter variable 
//should be declare below here 
reg [7:0] pkt_step_count,pkt_step_count_inc;

reg [7:0] INPORT;
reg [47:0] DMAC;
reg [47:0] SMAC;
reg [15:0] ETH_TYPE;
reg [7:0] IP_PROTO;
reg [31:0] SIP;
reg [31:0] DIP;
reg [15:0] SPORT;
reg [15:0] DPORT;

wire is_ipv4;
wire is_tcp;
wire is_udp;

//***************************************************
//                 Retransmit Pkt
//***************************************************
assign parser2next_data_wr = port2parser_data_wr;
assign parser2next_data = port2parser_data;
assign parser2port_alf = next2parser_alf;

//***************************************************
//                 Pkt Step Count
//***************************************************
//count the pkt cycle step for locate parse procotol field
//compare with pkt_step_count, pkt_step count_inc always change advance 1 cycle

always @* begin
    if(port2parser_data_wr == 1'b1) begin//a pkt is receiving
        if(port2parser_data[133:132] == 2'b01) begin//pkt head
            pkt_step_count_inc = 8'b0;
        end
        else begin
            pkt_step_count_inc = pkt_step_count + 8'd1;
        end
    end
    else begin
        pkt_step_count_inc = pkt_step_count;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        pkt_step_count <= 8'b0;
    end
    else begin
        pkt_step_count <= pkt_step_count_inc;
    end
end

//***************************************************
//                 Key Field Parse
//***************************************************
//------INPORT/DMAC/SMAC/ETH_TYPE Field Parse----------
always @(posedge clk) begin
    if((port2parser_data_wr == 1'b1) && (pkt_step_count_inc == 8'd0)) begin
        INPORT <= {5'b0,port2parser_data[110],port2parser_data[59:58]};//slot id + inport number
    end
    else begin
        INPORT <= INPORT;
    end
end
//------DMAC/SMAC/ETH_TYPE Field Parse----------
always @(posedge clk) begin
    if((port2parser_data_wr == 1'b1) && (pkt_step_count_inc == 8'd2)) begin//eth head
        DMAC <= port2parser_data[127:80];
        SMAC <= port2parser_data[79:32];
        ETH_TYPE <= port2parser_data[31:16]; 
    end
    else begin
        DMAC <= DMAC;
        SMAC <= SMAC;
        ETH_TYPE <= ETH_TYPE; 
    end
end

assign is_ipv4 = (ETH_TYPE == 16'h0800);

//------IP_PROTO/SIP/DIP Field Parse----------
always @(posedge clk) begin
    if((port2parser_data_wr == 1'b1) && (pkt_step_count_inc == 8'd3)) begin
    //second pkt line, ip head
        IP_PROTO <= port2parser_data[71:64];
        SIP <= port2parser_data[47:16];
        DIP[31:16] <= port2parser_data[15:0];
    end
    else if((port2parser_data_wr == 1'b1) && (pkt_step_count_inc == 8'd4)) begin
    //third pkt line, destination ip last 4 byte
        DIP[15:0] <= port2parser_data[127:112];//parse DIP's last 4 byte
    end
    else begin
        IP_PROTO <= IP_PROTO;
        SIP <= SIP;
        DIP <= DIP;
    end
end

assign is_tcp = (is_ipv4) && (IP_PROTO == 16'h6);
assign is_udp = (is_ipv4) && (IP_PROTO == 16'h11);

//------SPORT/DPORT Field Parse----------
always @(posedge clk) begin
    if((port2parser_data_wr == 1'b1) && (pkt_step_count_inc == 8'd4)) begin
        SPORT <= port2parser_data[111:96];
        DPORT <= port2parser_data[95:80];
    end
    else begin
        SPORT <= SPORT;
        DPORT <= DPORT;
    end
end


//***************************************************
//                 Key Field Wrapper
//***************************************************
assign parser2lookup_key[287:240] = SMAC;
assign parser2lookup_key[239:192] = DMAC;
assign parser2lookup_key[191:176] = ETH_TYPE;
assign parser2lookup_key[175:144] = (is_ipv4) ? SIP : 32'hffff_ffff;
assign parser2lookup_key[143:112] = (is_ipv4) ? DIP : 32'hffff_ffff;
assign parser2lookup_key[111:104] = (is_ipv4) ? IP_PROTO : 8'hff;
assign parser2lookup_key[103:88]  = (is_tcp || is_udp) ? SPORT : 16'hffff;
assign parser2lookup_key[87:72]   = (is_tcp || is_udp) ? DPORT : 16'hffff;
assign parser2lookup_key[71:64]   = INPORT;
assign parser2lookup_key[63:0]    = 64'hffff_ffff_ffff_ffff;


always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        parser2lookup_key_wr <= 1'b0;
    end
    else begin
        if(port2parser_valid_wr == 1'b1) begin
        //send key at last cycle of pkt
            parser2lookup_key_wr <= 1'b1;
        end
        else begin
            parser2lookup_key_wr <= 1'b0;
        end
    end
end

endmodule


/**********************************
            Initial Inst
            
parser parser(
.clk(),
.rst_n(),
    
//input pkt from port
.port2parser_data_wr(),
.port2parser_data(),
.port2parser_valid_wr(),
.port2parser_valid(),
.parser2port_alf(),
//parse key which transmit to lookup
.parser2lookup_key_wr(),
.parser2lookup_key(),
//transport to next module
.parser2next_data_wr(),
.parser2next_data(),
.next2parser_alf()
);
**********************************/