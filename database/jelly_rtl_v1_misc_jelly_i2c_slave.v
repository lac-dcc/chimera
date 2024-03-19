// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none


//
module jelly_i2c_slave
        #(
            parameter   DIVIDER_WIDTH = 6,
            parameter   DIVIDER_COUNT = 63
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [7:1]               addr,
            
            // I2C
            input   wire                        i2c_scl_i,
            output  wire                        i2c_scl_t,
            input   wire                        i2c_sda_i,
            output  wire                        i2c_sda_t,
            
            // memport
            output  wire                        bus_start,
            output  wire                        bus_en,
            output  wire                        bus_rw,
            output  wire    [7:0]               bus_wdata,
            input   wire    [7:0]               bus_rdata
        );
    
    
    // double latch
    reg     [1:0]   reg_scl_ff;
    reg     [1:0]   reg_sda_ff;
    always @( posedge clk ) begin
        reg_scl_ff[0] <= i2c_scl_i;
        reg_scl_ff[1] <= reg_scl_ff[0];
        reg_sda_ff[0] <= i2c_sda_i;
        reg_sda_ff[1] <= reg_sda_ff[0];
    end
    
    
    // clock diveder
    reg                             reg_clk_en;
    reg     [DIVIDER_COUNT-1:0]     reg_clkdiv_count;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_clkdiv_count <= DIVIDER_COUNT;
            reg_clk_en       <= 1'b0;
        end
        else begin
            reg_clkdiv_count <= reg_clkdiv_count - 1'b1;
            if ( reg_clkdiv_count == 0 ) begin
                reg_clkdiv_count <= DIVIDER_COUNT;
            end
            reg_clk_en <= (reg_clkdiv_count == 0);
        end
    end
    
    
    // sontrol
    reg     [1:0]   reg_scl;
    reg     [1:0]   reg_sda;
    
    localparam  ST_IDLE = 0, ST_ACK = 1, ST_ADDR = 2, ST_DATA = 3;
    reg     [1:0]   reg_state;
    reg     [3:0]   reg_counter;
    reg     [7:0]   reg_recv;
    reg     [7:0]   reg_send;
    reg             reg_rw;
    reg             reg_sda_t;
    
    reg             reg_bus_en;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_scl <= 2'b11;
            reg_sda <= 2'b11;
            
            reg_state   <= ST_IDLE;
            reg_counter <= 4'hx;
            reg_recv    <= 8'hxx;
            reg_send    <= 8'hxx;
            reg_rw      <= 1'bx;
            reg_sda_t   <= 1'b1;
            reg_bus_en  <= 1'b0;
        end
        else begin
            reg_bus_en <= 1'b0;
            if ( reg_clk_en ) begin
                // 信号取り込み
                reg_scl[0] <= reg_scl_ff[1];
                reg_scl[1] <= reg_scl[0];
                reg_sda[0] <= reg_sda_ff[1];
                reg_sda[1] <= reg_sda[0];
                
                // データ転送
                if ( reg_state == ST_ADDR || reg_state == ST_DATA ) begin
                    // SCL立ち下がりで送信
                    if ( reg_scl == 2'b10 ) begin
                        reg_sda_t <= reg_send[7];
                        reg_send  <= {reg_send[6:0], reg_rw};
                        
                        if ( reg_counter[3] ) begin
                            reg_bus_en <= 1'b1;
                        end
                        
                        // アドレス受信末尾なら
                        if ( reg_state == ST_ADDR && reg_counter[3] ) begin
                            reg_rw <= reg_recv[0];
                            if ( reg_recv[7:1] == addr ) begin
                                reg_sda_t <= 1'b0;  // ACK出力
                            end
                            else begin
                                reg_sda_t  <= 1'b1; // NAK出力
                                reg_state  <= ST_IDLE;
                                reg_bus_en <= 1'b0;
                            end
                        end
                    end
                    
                    // SCL立ち上がりで受信
                    if ( reg_scl == 2'b01 ) begin
                        reg_counter <= reg_counter + 1'b1;
                        
                        // ACKフェーズ
                        if ( reg_counter[3] ) begin
                            reg_counter <= 0;
                            
                            // 次のフェーズ準備
                            reg_state   <= ST_DATA;
                            if ( reg_rw == 1'b0 ) begin
                                // write準備
                                reg_send  <= 8'hff;
                            end
                            else begin
                                // 次のread準備
                                reg_send  <= bus_rdata;
                                
                                // read で ack がなければエラー
                                if ( reg_sda != 1'b0 ) begin
                                    reg_sda_t <= 1'b1;
                                    reg_state <= ST_IDLE;
                                end
                            end
                        end
                        else begin
                            // 受信
                            reg_recv <= {reg_recv[6:0], reg_sda[0]};
                        end
                    end
                end
                
                // start conditon
                if ( reg_scl == 2'b11 && reg_sda == 2'b10 ) begin
                    reg_state   <= ST_ADDR;     // アドレス受信開始
                    reg_counter <= 0;
                    reg_send    <= 8'hff;
                    reg_rw      <= 1'b0;
                end
                
                // stop condition
                if ( reg_scl == 2'b11 && reg_sda == 2'b01 ) begin
                    reg_state <= ST_IDLE;       // 強制的にアイドルに戻る
                end
            end
        end
    end
    
    assign i2c_scl_t = 1'b1;
    assign i2c_sda_t = reg_sda_t;
    
    assign bus_en    = reg_bus_en;
    assign bus_start = (reg_state == ST_ADDR);
    assign bus_rw    = reg_rw;
    assign bus_wdata = reg_recv;
    
endmodule


`default_nettype wire


// end of file
