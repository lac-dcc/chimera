// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*******************************************************************************/
module i2c_eeprom_test(
    input            clk,
    input            rst_n,
    input            key1,
    inout            i2c_sda,
    inout            i2c_scl,
    output [5:0]     seg_sel,
    output [7:0]     seg_data
);
localparam S_IDLE       = 0;
localparam S_READ       = 1;
localparam S_WAIT       = 2;
localparam S_WRITE      = 3;
reg[3:0] state;

wire button_negedge;
reg[7:0] read_data;
reg[31:0] timer;

wire scl_pad_i;
wire scl_pad_o;
wire scl_padoen_o;

wire sda_pad_i;
wire sda_pad_o;
wire sda_padoen_o;

reg[ 7:0] i2c_slave_dev_addr;
reg[15:0] i2c_slave_reg_addr;
reg[ 7:0] i2c_write_data;
reg i2c_read_req;
wire i2c_read_req_ack;
reg i2c_write_req;
wire i2c_write_req_ack;
wire[7:0] i2c_read_data;

ax_debounce ax_debounce_m0
(
    .clk             (clk),
    .rst             (~rst_n),
    .button_in       (key1),
    .button_posedge  (),
    .button_negedge  (button_negedge),
    .button_out      ()
);
wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (read_data[3:0]),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (read_data[7:4]),
    .seg_data  (seg_data_1)
);
seg_scan seg_scan_m0(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,7'b1111_111}),
    .seg_data_1 ({1'b1,7'b1111_111}),
    .seg_data_2 ({1'b1,7'b1111_111}),
    .seg_data_3 ({1'b1,7'b1111_111}),
    .seg_data_4 ({1'b1,seg_data_1}),
    .seg_data_5 ({1'b1,seg_data_0})
);
    
always@(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        state <= S_IDLE;
        i2c_write_req <= 1'b0;
        read_data <= 8'h00;
        timer <= 32'd0;
        i2c_write_data <= 8'd0;
        i2c_slave_reg_addr <= 16'd0;
        i2c_slave_dev_addr <= 8'ha0;//1010 000 0(default address ¡®000¡¯ write operation)
        i2c_read_req <= 1'b0;
    end
    else
        case(state)
            S_IDLE:
            begin
                if(timer >= 32'd12_499_999)//250ms
                    state <= S_READ;
                else
                    timer <= timer + 32'd1;
            end
            S_READ:
            begin
                if(i2c_read_req_ack)
                begin
                    i2c_read_req <= 1'b0;
                    read_data <= i2c_read_data;
                    state <= S_WAIT;
                end
                else
                begin
                    i2c_read_req <= 1'b1;
                    i2c_slave_dev_addr <= 8'ha0;
                    i2c_slave_reg_addr <= 16'd0;
                end
            end
            S_WAIT:
            begin
                if(button_negedge)
                begin
                    state <= S_WRITE;
                    read_data <= read_data + 8'd1;
                end
            end
            S_WRITE:
            begin
                if(i2c_write_req_ack)
                begin
                    i2c_write_req <= 1'b0;
                    state <= S_READ;
                end
                else
                begin
                    i2c_write_req <= 1'b1;
                    i2c_write_data <= read_data;
                end
            end
            
            default:
                state <= S_IDLE;
        endcase
end

assign sda_pad_i = i2c_sda;
assign i2c_sda = ~sda_padoen_o ? sda_pad_o : 1'bz;
assign scl_pad_i = i2c_scl;
assign i2c_scl = ~scl_padoen_o ? scl_pad_o : 1'bz;

i2c_master_top i2c_master_top_m0
(
    .rst(~rst_n),
    .clk(clk),
    .clk_div_cnt(16'd500),       //Standard mode:100Khz
    
    // I2C signals 
    // i2c clock line
    .scl_pad_i(scl_pad_i),            // SCL-line input
    .scl_pad_o(scl_pad_o),            // SCL-line output (always 1'b0)
    .scl_padoen_o(scl_padoen_o),      // SCL-line output enable (active low)

    // i2c data line
    .sda_pad_i(sda_pad_i),           // SDA-line input
    .sda_pad_o(sda_pad_o),           // SDA-line output (always 1'b0)
    .sda_padoen_o(sda_padoen_o),     // SDA-line output enable (active low)
    
    
    .i2c_addr_2byte(1'b0),
    .i2c_read_req(i2c_read_req),
    .i2c_read_req_ack(i2c_read_req_ack),
    .i2c_write_req(i2c_write_req),
    .i2c_write_req_ack(i2c_write_req_ack),
    .i2c_slave_dev_addr(i2c_slave_dev_addr),
    .i2c_slave_reg_addr(i2c_slave_reg_addr),
    .i2c_write_data(i2c_write_data),
    .i2c_read_data(i2c_read_data),
    .error()
);
wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug 
(
    .CONTROL0(CONTROL0) 
);

chipscope_ila ila_filter_debug 
(
    .CONTROL(CONTROL0),
    .CLK(clk),      
    .TRIG0(TRIG0)     
   
);                                                     

assign TRIG0[7:0] = i2c_write_data; 
assign TRIG0[15:8]= i2c_read_data;       

endmodule 