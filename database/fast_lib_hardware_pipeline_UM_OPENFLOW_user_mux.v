////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: user_mux.v
//Target Device: Altera
//Dscription: 
//  1)receive up cpu and lookup hit pkt stream 
//  2)judge these 2 stream ,mux them to 1 single stream
//  3)
//
//  pkt type:
//      pkt_site    2bit    :   2'b01 pkt head / 2'b11 pkt body / 2'b10 pkt tail
//      invalid     4bit    :   the invalid byte sum of every payload cycle
//      payload     128bit  :   pkt payload
//
//
//Author : 
//Revision List:
//	rn1:	date:	modifier:	description:
//	rn2:	date:	modifier:	description:
//
module user_mux(
    input clk,
    input rst_n,
//lookup pkt waiting for transmit
    input disp2usermux_data_wr,
    input [133:0] disp2usermux_data,
    input disp2usermux_valid_wr,
    input disp2usermux_valid,
    output usermux2disp_alf,
//up cpu pkt waiting for transmit
    input up2usermux_data_wr,
    input [133:0] up2usermux_data,
    input up2usermux_valid_wr,
    input up2usermux_valid,
    output usermux2up_alf,
//transmit to down port
    output reg usermux2down_data_wr,
    output reg [133:0] usermux2down_data,
    output reg usermux2down_valid_wr,
    output usermux2down_valid,
    input down2usermux_alf
);
//***************************************************
//        Intermediate variable Declaration
//***************************************************
//all wire/reg/parameter variable 
//should be declare below here 
reg up_dfifo_rd;
wire [133:0] up_dfifo_rdata;
wire [7:0] up_dfifo_usedw;

reg up_vfifo_rd;
wire up_vfifo_rdata;
wire up_vfifo_empty;

reg disp_dfifo_rd;
wire [133:0] disp_dfifo_rdata;
wire [7:0] disp_dfifo_usedw;

reg disp_vfifo_rd;
wire disp_vfifo_rdata;
wire disp_vfifo_empty;

reg last_select;//which direction last pkt select
// 0:send up cpu's pkt   1: send dispute's pkt
reg grant_bit;//current pkt direction selecct
reg has_pkt;
reg [1:0] usermux_state;
//***************************************************
//                 Stream Judge
//***************************************************

always @ * begin
    case({disp_vfifo_empty,up_vfifo_empty})
        2'b00: begin has_pkt = 1'b1; grant_bit = ~last_select; end//both direction have pkt,so select different with last
        2'b01: begin has_pkt = 1'b1; grant_bit = 1'b1; end//just dispcute have pkt need to sending 
        2'b10: begin has_pkt = 1'b1; grant_bit = 1'b0; end//just up cpu have pkt need to sending
        2'b11: begin has_pkt = 1'b0; grant_bit = last_select; end//both no pkt,hold last select
    endcase
end

//***************************************************
//                 Stream Judge
//***************************************************
assign usermux2disp_alf = disp_dfifo_usedw[7];
assign usermux2up_alf = up_dfifo_usedw[7];

assign usermux2down_valid = usermux2down_valid_wr;


localparam  IDLE_S = 2'd0,
            SEND_EXE_S = 2'd1,
            SEND_UP_S = 2'd2;
            
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        last_select <= 1'b0;
        
        usermux2down_data_wr <= 1'b0;
        usermux2down_valid_wr <= 1'b0;
        
        up_dfifo_rd <= 1'b0;
        up_vfifo_rd <= 1'b0;
        disp_dfifo_rd <= 1'b0;
        disp_vfifo_rd <= 1'b0;
        
        usermux_state <= IDLE_S;
    end
    else begin
        case(usermux_state)
            IDLE_S: begin
                usermux2down_data_wr <= 1'b0;
                usermux2down_valid_wr <= 1'b0;
                if((down2usermux_alf == 1'b0) && (has_pkt == 1'b1)) begin
                   //there is at least a pkt ,& next module can receive a pkt
                    last_select <= grant_bit;
                    if(grant_bit == 1'b0) begin//send up cpu's pkt
                        up_dfifo_rd <= 1'b1;
                        up_vfifo_rd <= 1'b1;
                        disp_dfifo_rd <= 1'b0;
                        disp_vfifo_rd <= 1'b0;
                        usermux_state <= SEND_UP_S;
                    end
                    else begin
                        up_dfifo_rd <= 1'b0;
                        up_vfifo_rd <= 1'b0;
                        disp_dfifo_rd <= 1'b1;
                        disp_vfifo_rd <= 1'b1;
                        usermux_state <= SEND_EXE_S;
                    end
                end
                else begin
                    up_dfifo_rd <= 1'b0;
                    up_vfifo_rd <= 1'b0;
                    disp_dfifo_rd <= 1'b0;
                    disp_vfifo_rd <= 1'b0;
                    usermux_state <= IDLE_S;
                end
            end
            
            SEND_UP_S:begin
                up_vfifo_rd <= 1'b0;
                usermux2down_data_wr <= 1'b1;
                usermux2down_data <= up_dfifo_rdata;
                if(up_dfifo_rdata[133:132] == 2'b10)begin//end of pkt
                    up_dfifo_rd <= 1'b0;
                    usermux2down_valid_wr <= 1'b1;
                    usermux_state <= IDLE_S;
                end
                else begin
                    up_dfifo_rd <= 1'b1;
                    usermux2down_valid_wr <= 1'b0;
                    usermux_state <= SEND_UP_S;
                end
            end
            
            SEND_EXE_S:begin
                disp_vfifo_rd <= 1'b0;
                usermux2down_data_wr <= 1'b1;
                usermux2down_data <= disp_dfifo_rdata;
                if(disp_dfifo_rdata[133:132] == 2'b10)begin//end of pkt
                    disp_dfifo_rd <= 1'b0;
                    usermux2down_valid_wr <= 1'b1;
                    usermux_state <= IDLE_S;
                end
                else begin
                    disp_dfifo_rd <= 1'b1;
                    usermux2down_valid_wr <= 1'b0;
                    usermux_state <= SEND_EXE_S;
                end
            end
            
            default: begin
                last_select <= 1'b0;
            
                usermux2down_data_wr <= 1'b0;
                usermux2down_valid_wr <= 1'b0;
                
                up_dfifo_rd <= 1'b0;
                up_vfifo_rd <= 1'b0;
                disp_dfifo_rd <= 1'b0;
                disp_vfifo_rd <= 1'b0;
                
                usermux_state <= IDLE_S;
            end
        endcase
    end
end


//***************************************************
//                  Other IP Instance
//***************************************************
//likely fifo/ram/async block.... 
//should be instantiated below here 

fifo_256_134 up_dfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(up2usermux_data_wr),
    .data(up2usermux_data),
    .rdreq(up_dfifo_rd),
    .q(up_dfifo_rdata),
    .usedw(up_dfifo_usedw)
);

fifo_64_1 up_vfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(up2usermux_valid_wr),
    .data(up2usermux_valid),
    .rdreq(up_vfifo_rd),
    .q(up_vfifo_rdata),
    .empty(up_vfifo_empty)
);

fifo_256_134 disp_dfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(disp2usermux_data_wr),
    .data(disp2usermux_data),
    .rdreq(disp_dfifo_rd),
    .q(disp_dfifo_rdata),
    .usedw(disp_dfifo_usedw)
);

fifo_64_1 disp_vfifo(
    .aclr(~rst_n),
    .clock(clk),
    .wrreq(disp2usermux_valid_wr),
    .data(disp2usermux_valid),
    .rdreq(disp_vfifo_rd),
    .q(disp_vfifo_rdata),
    .empty(disp_vfifo_empty)
);
endmodule



/**********************************
            Initial Inst
            
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
    .up2usermux_data_wr(um2npe_data_wr),
    .up2usermux_data(um2npe_data),
    .up2usermux_valid_wr(um2npe_valid_wr),
    .up2usermux_valid(um2npe_valid),
    .usermux2up_alf(npe2um_alf),
    //transmit to down port
    .usermux2down_data_wr(um2cdp_data_wr),
    .usermux2down_data(um2cdp_data),
    .usermux2down_valid_wr(um2cdp_valid_wr),
    .usermux2down_valid(um2cdp_valid),
    .down2usermux_alf(cdp2um_alf)
);

**********************************/