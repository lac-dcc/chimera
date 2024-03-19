////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2016-2020 NUDT, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//Vendor: NUDT
//Version: 0.1
//Filename: dispatch.v
//Target Device: Altera
//Dscription: 
//  1)receive execute pkt,and transmit it as execute's request
//  2)judge execute's request by 2 stream's alf signal
//
//  pkt type:
//      pkt_site    2bit    :   2'b01 pkt head / 2'b11 pkt body / 2'b10 pkt tail
//      invalid     4bit    :   the invalid byte sum of every payload cycle
//      payload     128bit  :   pkt payload
//
//
//Author : 
//Revision List:
//	rn1: 
//      date: 2016/10/11
//      modifier: lxj
//      description: fix a fatal error state jump in TRANS_UP_S and TRANS_DOWN_S,
//                   if valid wr is 1,jump to IDLE_S,or stay(error is opposed)
//
//	rn2:	date:	modifier:	description:
//
module dispatch(
    input clk,
    input rst_n,
//execute module's pkt waiting for transmit
    input exe2disp_data_wr,
    input [133:0] exe2disp_data,
    input exe2disp_valid_wr,
    input exe2disp_valid,
    output reg disp2exe_alf,
//execute's tranmit direction request
    input exe2disp_direction_req,
    input exe2disp_direction,//0:up cpu  1: down port 
//transmit to up cpu
    output reg disp2up_data_wr,
    output  [133:0] disp2up_data,
    output reg disp2up_valid_wr,
    output disp2up_valid,
    input up2disp_alf,
//transmit to down port
    output reg disp2down_data_wr,
    output  [133:0] disp2down_data,
    output reg disp2down_valid_wr,
    output disp2down_valid,
    input down2disp_alf
);

//***************************************************
//        Intermediate variable Declaration
//***************************************************
//all wire/reg/parameter variable 
//should be declare below here 

reg [133:0] data_buff;
//only 1 stream path would be select at a time,so no need 2 set data registers
reg [1:0] disp_state;
//***************************************************
//                 Transmit Judge
//***************************************************
assign disp2up_data = data_buff;
assign disp2down_data = data_buff;

assign disp2up_valid = disp2up_valid_wr;
assign disp2down_valid = disp2down_valid_wr;

//receive controll ,ctrl by disp2exe_alf
//if set to 1,execute must not send pkt to dispatch
always @ * begin
    if(exe2disp_direction_req == 1'b1) begin
        if(exe2disp_direction == 1'b0) begin//request send to up cpu
            disp2exe_alf = up2disp_alf;
        end
        else begin//request send to down port
            disp2exe_alf = down2disp_alf;
        end
    end
    else begin
        disp2exe_alf = 1'b1;//don't permit execute send pkt
    end
end


//pkt data transmit
localparam  IDLE_S = 2'd0,
            TRANS_UP_S = 2'd1,
            TRANS_DOWN_S = 2'd2;
            
always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
        disp2up_data_wr <= 1'b0;
        disp2up_valid_wr <= 1'b0;
        disp2down_data_wr <= 1'b0;
        disp2down_valid_wr <= 1'b0;
        disp_state <= IDLE_S;
    end
    else begin
        case(disp_state)
            IDLE_S: begin
                if(exe2disp_data_wr == 1'b1) begin//trans start
                    data_buff <= exe2disp_data;
                    if(exe2disp_direction == 1'b0) begin//request send to up cpu
                        disp2up_data_wr <= exe2disp_data_wr;
                        disp2up_valid_wr <= exe2disp_valid_wr;
                        disp2down_data_wr <= 1'b0;
                        disp2down_valid_wr <= 1'b0;
                        disp_state <= TRANS_UP_S;
                    end
                    else begin//request send to down port
                        disp2up_data_wr <= 1'b0;
                        disp2up_valid_wr <= 1'b0;
                        disp2down_data_wr <= exe2disp_data_wr;
                        disp2down_valid_wr <= exe2disp_valid_wr;
                        disp_state <= TRANS_DOWN_S;
                    end
                end
                else begin
                    disp2up_data_wr <= 1'b0;
                    disp2up_valid_wr <= 1'b0;
                    disp2down_data_wr <= 1'b0;
                    disp2down_valid_wr <= 1'b0;
                    disp_state <= IDLE_S;
                end
            end
            
            TRANS_UP_S: begin
                data_buff <= exe2disp_data;
                disp2up_data_wr <= exe2disp_data_wr;
                disp2up_valid_wr <= exe2disp_valid_wr;
                if(exe2disp_valid_wr == 1'b1) begin//trans end
                    disp_state <= IDLE_S;
                end
                else begin
                    disp_state <= TRANS_UP_S;
                end
            end
            
            TRANS_DOWN_S: begin
                data_buff <= exe2disp_data;
                disp2down_data_wr <= exe2disp_data_wr;
                disp2down_valid_wr <= exe2disp_valid_wr;
                if(exe2disp_valid_wr == 1'b1) begin//trans end
                    disp_state <= IDLE_S;
                end
                else begin
                    disp_state <= TRANS_DOWN_S;
                end
            end
            
            default: begin
                disp2up_data_wr <= 1'b0;
                disp2up_valid_wr <= 1'b0;
                disp2down_data_wr <= 1'b0;
                disp2down_valid_wr <= 1'b0;
                disp_state <= IDLE_S;
            end
        endcase
        
    end
end

endmodule

/**********************************
            Initial Inst
      
dispatch dispatch(
.clk();
.rst_n();
//execute module's pkt waiting for transmit
.exe2disp_data_wr();
.exe2disp_data();
.exe2disp_valid_wr();
.exe2disp_valid();
.disp2exe_alf();
//execute's tranmit direction request
.exe2disp_direction_req();
.exe2disp_direction();//0:up cpu  1: down port 
//transmit to up cpu
.disp2up_data_wr();
.disp2up_data();
.disp2up_valid_wr();
.disp2up_valid();
.up2disp_alf();
//transmit to down port
.disp2down_data_wr();
.disp2down_data();
.disp2down_valid_wr();
.disp2down_valid();
.down2disp_alf()
);

**********************************/