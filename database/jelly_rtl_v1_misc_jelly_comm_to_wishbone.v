// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none


// nop         8'h00
// nop               8'h80
//
// status      8'h01
// status_ack        8'h81 status
//
// read        8'h03       adr0 adr1 adr2 adr3 size  
// read_ack          8'ha0                          dat0 dat1 dat2 dat3 ....
//
// write       8'h02       adr0 adr1 adr2 adr3 size dat0 dat1 dat2 dat3 ....
// write_ack         8'h82                                                   8'hc2

`define COMM_CMD_NOP            8'h00
`define COMM_CMD_STATUS         8'h01
`define COMM_CMD_READ           8'h02
`define COMM_CMD_WRITE          8'h03

`define COMM_ACK_NOP            8'h80
`define COMM_ACK_STATUS         8'h81
`define COMM_ACK_READ           8'h82
`define COMM_ACK_WRITE          8'h83
`define COMM_ACK_WRITE_END      8'hc3


// debug comm
module jelly_comm_to_wishbone
        #(
            parameter   WB_ADR_WIDTH = 30,
            parameter   WB_DAT_SIZE  = 2,                   // log2 (0:8bit, 1:16nit, 2:32bit, ...)
            parameter   WB_DAT_WIDTH = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH = (1 << WB_DAT_SIZE)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        endian,
            
            // comm port
            output  wire    [7:0]               comm_tx_data,
            output  wire                        comm_tx_valid,
            input   wire                        comm_tx_ready,
            input   wire    [7:0]               comm_rx_data,
            input   wire                        comm_rx_valid,
            output  wire                        comm_rx_ready,
            
            // debug port (whishbone)
            output  wire    [WB_ADR_WIDTH-1:0]  wb_adr_o,
            input   wire    [WB_DAT_WIDTH-1:0]  wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  wb_dat_o,
            output  wire                        wb_we_o,
            output  wire    [WB_SEL_WIDTH-1:0]  wb_sel_o,
            output  wire                        wb_stb_o,
            input   wire                        wb_ack_i
        );
    
    localparam  ADR_BYTES    = ((WB_ADR_WIDTH + WB_DAT_SIZE + 7) >> 3) == 0 ? 1 : ((WB_ADR_WIDTH + WB_DAT_SIZE  + 7) >> 3);
    localparam  ADR_SEL_BITS = WB_DAT_SIZE == 0 ? 1 : WB_DAT_SIZE;
    
    // status
    wire    [7:0]   status_data;
    assign status_data[3:0]  = ADR_BYTES;
    assign status_data[6:4]  = WB_DAT_SIZE;
    assign status_data[7]    = endian;
    
    
    // state
    localparam  [3:0]   ST_IDLE       = 0;
    localparam  [3:0]   ST_ACK        = 1;
    localparam  [3:0]   ST_STATUS     = 2;
    localparam  [3:0]   ST_ADR        = 3;
    localparam  [3:0]   ST_SIZE       = 4;
    localparam  [3:0]   ST_WRITE      = 5;
    localparam  [3:0]   ST_WRITE_END  = 6;
    localparam  [3:0]   ST_READ_START = 7;
    localparam  [3:0]   ST_READ       = 8;
    
    reg     [3:0]               reg_state,      next_state;
    
    reg     [7:0]               reg_cmd,        next_cmd;
    reg     [7:0]               reg_size,       next_size;
    reg     [3:0]               reg_count,      next_count;
    reg     [ADR_SEL_BITS-1:0]  reg_adr_count,  next_adr_count;
    
    reg                         reg_tx_valid,   next_tx_valid;
    reg     [7:0]               reg_tx_data,    next_tx_data;
    
    reg                         reg_rx_ready,   next_rx_ready;
    
    reg     [WB_ADR_WIDTH-1:0]  reg_wb_adr_o,   next_wb_adr_o;
    reg     [WB_DAT_WIDTH-1:0]  reg_wb_dat_o,   next_wb_dat_o;
    reg                         reg_wb_we_o,    next_wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]  reg_wb_sel_o,   next_wb_sel_o;
    reg                         reg_wb_stb_o,   next_wb_stb_o;

    reg     [WB_DAT_WIDTH-1:0]  reg_read_data,  next_read_data;
//  reg                         reg_read_valid, next_read_valid;
    reg                         reg_read_last,  next_read_last;
    
    reg     [WB_SEL_WIDTH-1:0]  tmp_read_first_mask;
    reg     [WB_SEL_WIDTH-1:0]  tmp_read_last_mask;
    
    integer                     i, j;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_state      <= ST_IDLE;
            reg_cmd        <= {8{1'bx}};
            reg_size       <= {8{1'bx}};
            reg_count      <= {2{1'bx}};
            reg_adr_count  <= {ADR_SEL_BITS{1'bx}};
            
            reg_tx_valid   <= 1'b0;
            reg_tx_data    <= {8{1'bx}};
            
            reg_rx_ready   <= 1'b1;
            
            reg_wb_adr_o   <= {WB_ADR_WIDTH{1'bx}};
            reg_wb_dat_o   <= {WB_DAT_WIDTH{1'bx}};
            reg_wb_we_o    <= 1'bx;
            reg_wb_sel_o   <= {WB_SEL_WIDTH{1'bx}};
            reg_wb_stb_o   <= 1'b0;
            
//          reg_read_valid <= 1'bx;
            reg_read_data  <= {WB_DAT_WIDTH{1'bx}};
            reg_read_last  <= 1'bx;
        end
        else begin
            reg_state      <= next_state;
            reg_cmd        <= next_cmd;
            reg_size       <= next_size;
            reg_count      <= next_count;
            reg_adr_count  <= next_adr_count;
            
            reg_tx_valid   <= next_tx_valid;
            reg_tx_data    <= next_tx_data;
            
            reg_rx_ready   <= next_rx_ready;
                            
            reg_wb_adr_o   <= next_wb_adr_o;
            reg_wb_dat_o   <= next_wb_dat_o;
            reg_wb_we_o    <= next_wb_we_o;
            reg_wb_sel_o   <= next_wb_sel_o;
            reg_wb_stb_o   <= next_wb_stb_o;
            
//          reg_read_valid <= next_read_valid;
            reg_read_data  <= next_read_data;
            reg_read_last  <= next_read_last;
        end
    end
    
    
    always @* begin
        next_state      = reg_state;
        next_cmd        = reg_cmd;
        next_size       = reg_size;
        next_count      = reg_count;
        next_adr_count  = reg_adr_count;
        
        next_tx_valid   = reg_tx_valid;
        next_tx_data    = reg_tx_data;
        
        next_rx_ready   = reg_rx_ready;
        
        next_wb_adr_o   = reg_wb_adr_o;
        next_wb_dat_o   = reg_wb_dat_o;
        next_wb_we_o    = reg_wb_we_o;
        next_wb_sel_o   = reg_wb_sel_o;
        next_wb_stb_o   = reg_wb_stb_o;
        
//      next_read_valid = reg_read_valid;
        next_read_data  = reg_read_data;
        next_read_last  = reg_read_last;
        
        
        // wishbone access end
        if ( wb_ack_i ) begin
//          next_read_valid = 1'b1;
            next_read_data  = wb_dat_i;
            next_wb_adr_o   = reg_wb_adr_o + 1;
            next_wb_sel_o   = 4'b0000;
            next_wb_stb_o   = 1'b0;
        end
        
        // fifo tx access end
        if ( comm_tx_ready ) begin
            next_tx_valid = 1'b0;
        end
        
        // create read mask
        tmp_read_first_mask = {WB_SEL_WIDTH{1'b1}};
        tmp_read_last_mask  = {WB_SEL_WIDTH{1'b1}};
        if ( WB_DAT_SIZE > 0 ) begin
            if ( endian ) begin
                tmp_read_first_mask = ~({WB_SEL_WIDTH{1'b1}} >> ((1 << WB_DAT_SIZE) - reg_wb_adr_o[ADR_SEL_BITS-1:0]));
            end
            else begin
                tmp_read_first_mask = ~({WB_SEL_WIDTH{1'b1}} << ((1 << WB_DAT_SIZE) - reg_wb_adr_o[ADR_SEL_BITS-1:0]));
            end
        end
        if ( reg_read_last && (WB_DAT_SIZE > 0) ) begin
            if ( endian ) begin
                tmp_read_last_mask = ~({WB_SEL_WIDTH{1'b1}} >> reg_size[WB_DAT_SIZE-1:0]);
            end
            else begin
                tmp_read_last_mask = ~({WB_SEL_WIDTH{1'b1}} << reg_size[WB_DAT_SIZE-1:0]);
            end
        end
        
        case ( reg_state )
        ST_IDLE:
            begin
                next_cmd     = comm_rx_data;
                next_tx_data = (next_cmd ^ 8'h80);
                if ( comm_rx_valid ) begin
                    next_tx_valid = 1'b1;
                    next_rx_ready = 1'b0;
                    next_state    = ST_ACK;
                end
            end
            
        ST_ACK:
            begin
                next_count = 0;
                if ( comm_tx_ready ) begin
                    case ( reg_cmd )
                    `COMM_CMD_NOP:      begin next_state = ST_IDLE;   next_tx_valid = 1'b0; next_rx_ready = 1'b1; end
                    `COMM_CMD_STATUS:   begin next_state = ST_STATUS; next_tx_valid = 1'b1; next_tx_data  = status_data; next_rx_ready = 1'b0; end
                    `COMM_CMD_WRITE:    begin next_state = ST_ADR;    next_tx_valid = 1'b0; next_rx_ready = 1'b1; end
                    `COMM_CMD_READ:     begin next_state = ST_ADR;    next_tx_valid = 1'b0; next_rx_ready = 1'b1; end
                    default:            begin next_state = ST_IDLE;   next_tx_valid = 1'b0; next_rx_ready = 1'b1; end
                    endcase
                end
            end
            
        ST_STATUS:
            begin
                if ( comm_tx_ready ) begin
                    next_tx_valid = 1'b0;
                    next_rx_ready = 1'b1;
                    next_state    = ST_IDLE;
                end
            end
            
        ST_ADR:
            begin
                if ( comm_rx_valid ) begin
                    for ( i = 0; i < ADR_BYTES; i = i + 1 ) begin
                        if ( (endian && (reg_count == (ADR_BYTES-1 - i))) || (!endian && (reg_count == i)) ) begin
                            for ( j = 0; j < 8; j = j + 1 ) begin
                                if ( (i*8 + j < WB_ADR_WIDTH+WB_DAT_SIZE) && (i*8 + j >= WB_DAT_SIZE) ) begin
                                    next_wb_adr_o[i*8 + j - WB_DAT_SIZE] = comm_rx_data[j];
                                end
                                else if ( i*8 + j < WB_DAT_SIZE ) begin
                                    next_adr_count[i*8 + j] = comm_rx_data[j];
                                end
                            end
                        end
                    end
                    if ( reg_count == (ADR_BYTES-1) ) begin
                        next_state = ST_SIZE;
                    end
                    next_count = reg_count + 1;
                end
            end
            
        ST_SIZE:
            begin
                if ( comm_rx_valid ) begin
                    next_size  = comm_rx_data;
                    if ( reg_cmd[0] ) begin
                        next_wb_sel_o  = 0;
                        next_state     = ST_WRITE;
                    end
                    else begin
                        next_state     = ST_READ_START;
                        next_rx_ready  = 1'b0;
                        next_read_last = (((reg_wb_adr_o + comm_rx_data) >> WB_DAT_SIZE) == (reg_wb_adr_o >> WB_DAT_SIZE));
                    end
                end
            end
            
        ST_WRITE:
            begin
                next_wb_we_o = 1'b1;
                if ( wb_stb_o & wb_ack_i & !reg_rx_ready ) begin
                    next_tx_valid = 1'b1;
                    next_tx_data  = `COMM_ACK_WRITE_END;
                    next_state    = ST_WRITE_END;
                end
                if ( comm_rx_valid & comm_rx_ready ) begin
                    for ( i = 0; i < WB_SEL_WIDTH; i = i + 1 ) begin
                        if ( (i == (reg_adr_count ^ {ADR_SEL_BITS{endian}})) || (WB_DAT_SIZE == 0) ) begin
                            next_wb_sel_o[i] = 1'b1;
                            for ( j = 0; j < 8; j = j + 1 ) begin
                                next_wb_dat_o[i*8 + j] = comm_rx_data[j];
                            end
                        end
                    end
                    
                    next_adr_count = reg_adr_count + 1;
                    next_size      = reg_size - 1;
                    if ( next_size == 0 ) begin
                        next_rx_ready = 1'b0;
                    end
                    if ( (next_size == 0) || (next_adr_count == 0) ) begin
                        next_wb_stb_o = 1'b1;
                    end
                end
            end
            
        ST_WRITE_END:
            begin
                if ( comm_tx_ready ) begin
                    next_tx_valid   = 1'b0;
                    next_rx_ready   = 1'b1;
//                  next_read_valid = 1'b0;
                    next_state      = ST_IDLE;
                end
            end
            
        ST_READ_START:
            begin
                next_wb_sel_o = tmp_read_first_mask & tmp_read_last_mask;
                next_wb_we_o  = 1'b0;
                next_wb_stb_o = 1'b1;
                next_state    = ST_READ;
            end
            
        ST_READ:
            begin
                if ( !comm_tx_valid | comm_tx_ready ) begin
                    // comm
                    if ( !(wb_stb_o & !wb_ack_i) ) begin
                        next_tx_valid = 1'b1;
                        for ( i = 0; i < WB_SEL_WIDTH; i = i + 1 ) begin
                            if ( (i == ({ADR_SEL_BITS{endian}} ^ reg_adr_count)) || (WB_DAT_SIZE == 0) ) begin
                                for ( j = 0; j < 8; j = j + 1 ) begin
                                    if ( (reg_adr_count == 0) && wb_ack_i ) begin
                                        next_tx_data[j] = wb_dat_i[i*8 + j];
                                    end
                                    else begin
                                        next_tx_data[j] = reg_read_data[i*8 + j];
                                    end
                                end
                            end
                        end
                        next_adr_count = reg_adr_count + 1;
                        
                        if ( reg_size == 0 ) begin
                            next_wb_stb_o = 1'b0;
                            next_tx_valid = 1'b0;
                            next_rx_ready = 1'b1;
                            next_state    = ST_IDLE;
                        end
                        else if ( (reg_adr_count == {ADR_SEL_BITS{1'b1}}) || (WB_DAT_SIZE == 0) ) begin
                            next_wb_stb_o = 1'b1;
                        end
                        
                        next_size      = next_size - 1;
                        next_read_last = (reg_size < WB_SEL_WIDTH);
                    end
                    else begin
                        next_tx_valid = 1'b0;
                    end
                end
            end
        endcase
    end
    
    
    assign wb_adr_o      = reg_wb_adr_o;
    assign wb_dat_o      = reg_wb_dat_o;
    assign wb_we_o       = reg_wb_we_o;
    assign wb_sel_o      = reg_wb_sel_o;
    assign wb_stb_o      = reg_wb_stb_o;
    
    assign comm_tx_data  = reg_tx_data;
    assign comm_tx_valid = reg_tx_valid;
    
    assign comm_rx_ready = reg_rx_ready & !(wb_stb_o & !wb_ack_i);
    
endmodule


`default_nettype wire


// end of file
