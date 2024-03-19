/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: hist_rebuilder.v
 *  Purpose:  The key module of the histogram equalization process, that
 *            rebuilds raw histogram to change the image presentation way.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module hist_rebuilder
(
    input   wire            clk,
    input   wire            srst,
    
    output  wire            raw_hist_upd,
    input   wire            raw_hist_rdy,
    input   wire            hist_equal_type,
    
    output  wire            raw_hist_ram_we,
    output  wire    [13:0]  raw_hist_ram_addr,
    output  wire    [17:0]  raw_hist_ram_din,
    input   wire    [17:0]  raw_hist_ram_dout,
    
    output  wire            hist_lut_ram_we,
    output  wire    [13:0]  hist_lut_ram_addr,
    output  wire    [7:0]   hist_lut_ram_din
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  HIST_EQUAL_LINEAR = 1'b0,
                HIST_EQUAL_SQRT   = 1'b1;
    
    
    reg     [13:0]  hist_ram_addr = {14{1'b0}};
    reg     [13:0]  lut_ram_addr  = {14{1'b0}};
    
    reg     [17:0]  hist_raw_max_new = {18{1'b0}};
    reg     [17:0]  hist_raw_max     = {18{1'b0}};
    reg     [17:0]  hist_raw_min_new = {18{1'b1}};
    reg     [17:0]  hist_raw_min     = {18{1'b1}};
    reg     [17:0]  diff_max         = {18{1'b0}};
    reg     [17:0]  diff_min         = {18{1'b0}};
    
    reg             hist_upd         = 1'b0;
    reg             hist_remap       = 1'b0;
    reg             equal_type       = 1'b0;
    
    reg     [17:0]  scaler_div       = {18{1'b0}};
    reg     [17:0]  scaler_add       = {18{1'b0}};
    reg     [13:0]  scaler_din       = {14{1'b0}};
    reg             scaler_din_valid = 1'b0;
    wire            scaler_din_rdy;
    wire    [7:0]   scaler_dout;
    wire            scaler_dout_valid;
    
    
    assign raw_hist_upd = hist_upd;
    
    assign raw_hist_ram_we   = 1'b0;
    assign raw_hist_ram_din  = {18{1'b0}};
    assign raw_hist_ram_addr = hist_ram_addr;
    
    assign hist_lut_ram_we   = scaler_dout_valid;
    assign hist_lut_ram_din  = scaler_dout;
    assign hist_lut_ram_addr = lut_ram_addr;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  [3:0]   ST_LNR_0             = 4'd0,
                        ST_LNR_1             = 4'd1,
                        ST_LNR_2             = 4'd2,
                        ST_LNR_3             = 4'd3,
                        ST_LNR_4             = 4'd4,
                        ST_LNR_5             = 4'd5,
                        ST_LNR_6             = 4'd6,
                        ST_LNR_7             = 4'd7,
                        ST_LNR_8             = 4'd8,
                        ST_LNR_9             = 4'd9,
                        ST_LNR_10            = 4'd10,
                        ST_LNR_11            = 4'd11,
                        ST_LNR_DONE          = 4'd12,
                        FSM_LNR_RESET_STATE  = ST_LNR_0;
    
    reg         [3:0]   lnr_state = FSM_LNR_RESET_STATE;
    wire                lnr_done  = (lnr_state == ST_LNR_DONE);
    
    task hist_linear_equalize;
    begin
        case (lnr_state)
            ST_LNR_0: begin
                hist_remap       <= 1'b0;
                hist_ram_addr    <= 14'd0;
                hist_raw_max_new <= {18{1'b0}};
                hist_raw_min_new <= {18{1'b1}};
                lnr_state        <= ST_LNR_2;
            end
            
            /* Searching for min value */
            ST_LNR_1: begin
                if (hist_ram_addr < 14'd16383) begin
                    hist_ram_addr <= hist_ram_addr + 1'b1;
                    lnr_state <= ST_LNR_2;
                end else begin
                    /* Failed to find min value */
                    hist_raw_min_new <= {4'h0, {14{1'b0}}};
                    hist_ram_addr <= 14'd16383;
                    lnr_state <= ST_LNR_5;
                end
            end
            
            /* RAM single cycle read latency */
            ST_LNR_2: begin
                lnr_state <= ST_LNR_3;
            end
            
            /* Save new min value */
            ST_LNR_3: begin
                if (raw_hist_ram_dout != 18'd0) begin
                    hist_raw_min_new <= {4'h0, hist_ram_addr};
                    hist_ram_addr <= 14'd16383;
                    lnr_state <= ST_LNR_5;
                end else begin
                    lnr_state <= ST_LNR_1;
                end
            end
            
            /* Searching for max value */
            ST_LNR_4: begin
                if (hist_ram_addr > 14'd0) begin
                    hist_ram_addr <= hist_ram_addr - 1'b1;
                    lnr_state     <= ST_LNR_5;
                end else begin
                    /* Failed to find max value */
                    hist_raw_max_new <= {4'h0, {14{1'b1}}};
                    lnr_state <= ST_LNR_7;
                end
            end
            
            /* RAM single cycle read latency */
            ST_LNR_5: begin
                lnr_state <= ST_LNR_6;
            end
            
            /* Save new max value */
            ST_LNR_6: begin
                if (raw_hist_ram_dout != 18'd0) begin
                    hist_raw_max_new  <= {4'h0, hist_ram_addr};
                    lnr_state <= ST_LNR_7;
                end else begin
                    lnr_state <= ST_LNR_4;
                end
            end
            
            /* We are going to map the middle (~97%) of the histogram,
             * by cutting out min and max "bins" to make AGC procedure 
             * to be well immune against large and rapid deviation of 
             * very small amount of pixels. That helps to prevent 
             * undesirable image flickering */
            ST_LNR_7: begin
                hist_raw_max_new <= hist_raw_max_new - ((hist_raw_max_new - hist_raw_min_new) >> 6);
                hist_raw_min_new <= hist_raw_min_new + ((hist_raw_max_new - hist_raw_min_new) >> 6);
                lnr_state <= ST_LNR_8;
            end
            
            /* Calculating differences of the histogram width*/
            ST_LNR_8: begin
                
                /* Absolute difference of max */
                if (hist_raw_max_new >= hist_raw_max) begin
                    diff_max <= hist_raw_max_new - hist_raw_max;
                end else begin
                    diff_max <= hist_raw_max - hist_raw_max_new;
                end
                
                /* Absolute difference of min */
                if (hist_raw_min_new >= hist_raw_min) begin
                    diff_min <= hist_raw_min_new - hist_raw_min;
                end else begin
                    diff_min <= hist_raw_min - hist_raw_min_new;
                end
                
                lnr_state <= ST_LNR_9;
            end
            
            /* Due to LSB noise the max and min values will be updated
             * only when crossing the threshold. This  measure also 
             * prevents undesirable image flickering */
            ST_LNR_9: begin
                hist_raw_max <= (diff_max > 18'd3)? hist_raw_max_new : hist_raw_max;    // TODO: define threshold value !!!
                hist_raw_min <= (diff_min > 18'd3)? hist_raw_min_new : hist_raw_min;    // TODO: define threshold value !!!
                lnr_state <= ST_LNR_10;
            end
            
            /* Preparing parameters for histogram scaling */
            ST_LNR_10: begin
                scaler_div       <= hist_raw_max - hist_raw_min;
                scaler_add       <= hist_raw_min;
                scaler_din       <= 14'd0;
                scaler_din_valid <= 1'b1;
                hist_remap       <= 1'b1;
                lnr_state        <= ST_LNR_11;
            end
            
            /* Feeding histogram scaler with data counter */
            ST_LNR_11: begin
                if (scaler_din_rdy) begin
                    if (scaler_din < 14'd16383) begin
                        scaler_din <= scaler_din + 1'b1;
                    end else begin
                        scaler_din_valid <= 1'b0;
                        hist_remap <= 1'b0;
                        lnr_state  <= ST_LNR_DONE;
                    end
                end
            end
            
            ST_LNR_DONE: begin
                lnr_state <= FSM_LNR_RESET_STATE;
            end
        endcase
    end
    endtask
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [1:0]   ST_RST                 = 2'd0,
                        ST_RAW_HIST_UPD_START  = 2'd1,
                        ST_RAW_HIST_UPD_FINISH = 2'd2,
                        ST_RAW_HIST_EQUAL      = 2'd3;
    
    reg         [1:0]   state = ST_RST;
    
    
    always @(posedge clk) begin
        if (srst) begin
            hist_remap  <= 1'b0;
            hist_upd    <= 1'b0;
            state       <= ST_RST;
        end else begin
            case (state)
                ST_RST: begin
                    if (raw_hist_rdy) begin
                        hist_upd <= 1'b1;
                        state    <= ST_RAW_HIST_UPD_START;
                    end else begin
                        hist_upd <= 1'b0;
                    end
                end
                
                ST_RAW_HIST_UPD_START: begin
                    if (~raw_hist_rdy) begin
                        hist_upd <= 1'b0;
                        state    <= ST_RAW_HIST_UPD_FINISH;
                    end
                end
                
                ST_RAW_HIST_UPD_FINISH: begin
                    if (raw_hist_rdy) begin
                        equal_type <= hist_equal_type;
                        state      <= ST_RAW_HIST_EQUAL;
                    end
                end
                
                ST_RAW_HIST_EQUAL: begin
                    
                    /* Only linear histogram equalization is
                     * implemented for now, though multiple
                     * modes are supposed to be */
                
                    hist_linear_equalize();
                    state <= (lnr_done)? ST_RST : state;
                    
                end
            endcase
        end
    end
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    hist_scaler hist_scaler_inst
    (
        .clk        ( clk               ), 
        .srst       ( srst              ), 
        .div        ( scaler_div        ), 
        .add        ( scaler_add        ), 
        .din        ( (scaler_din > hist_raw_max)? hist_raw_max : scaler_din), 
        .din_valid  ( scaler_din_valid  ), 
        .din_rdy    ( scaler_din_rdy    ),
        .dout       ( scaler_dout       ), 
        .dout_valid ( scaler_dout_valid )
    );
    
    
    always @(posedge clk) begin
        if (~hist_remap) begin
            lut_ram_addr <= {14{1'b0}};
        end else begin
            if (scaler_dout_valid) begin
                lut_ram_addr <= lut_ram_addr + 1'b1;
            end
        end
    end
    
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
