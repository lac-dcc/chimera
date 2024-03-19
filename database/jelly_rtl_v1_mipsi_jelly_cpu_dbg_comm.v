// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// nop           8'h00
// nop                 8'h80
//
// status        8'h01
// status_ack          8'h81 status
//
// dbg_write     8'h02 sel+adr dat0 dat1 dat2 dat3
// dbg_write_ack                                    8'h82
//
// dbg_read      8'h03 sel+adr
// dbg_write_ack                8'h83 dat0 dat1 dat2 dat3
//
// mem_write     8'h04 size adr0 adr1 adr2 adr3 dat0 dat1 dat2 dat3 ....
// mem_write_ack                                                          8'h84
//
// mem_read      8'h05 size adr0 adr1 adr2 adr3 
// mem_write_ack                                 8'h85 dat0 dat1 dat2 dat3 ....


`define CMD_NOP         8'h00
`define CMD_STATUS      8'h01
`define CMD_DBG_WRITE   8'h02
`define CMD_DBG_READ    8'h03
`define CMD_MEM_WRIT    8'h04
`define CMD_MEM_READ    8'h05

`define ACK_NOP         8'h80
`define ACK_STATUS      8'h81
`define ACK_DBG_WRITE   8'h82
`define ACK_DBG_READ    8'h83
`define ACK_MEM_WRIT    8'h84
`define ACK_MEM_READ    8'h85



// debug comm
module jelly_cpu_dbg_comm
        (
            // system
            input   wire                reset,
            input   wire                clk,
            input   wire                endian,
            
            // comm port
            output  reg     [7:0]       comm_tx_data,
            output  reg                 comm_tx_valid,
            input   wire                comm_tx_ready,
            input   wire    [7:0]       comm_rx_data,
            input   wire                comm_rx_valid,
            output  reg                 comm_rx_ready,
            
            // debug port (whishbone)
            output  reg     [3:0]       wb_dbg_adr_o,
            input   wire    [31:0]      wb_dbg_dat_i,
            output  reg     [31:0]      wb_dbg_dat_o,
            output  reg                 wb_dbg_we_o,
            output  reg     [3:0]       wb_dbg_sel_o,
            output  reg                 wb_dbg_stb_o,
            input   wire                wb_dbg_ack_i
        );
    
    // state
    localparam  ST_NUM          = 26;
    
    localparam  ST_IDLE         = 0;
    localparam  ST_NOP_TX_ACK   = 1;
    localparam  ST_STAT_TX_ACK  = 2;
    localparam  ST_STAT_TX_STAT = 3;
    localparam  ST_DW_RX_ADDR   = 4;
    localparam  ST_DW_RX_DATA   = 5;
    localparam  ST_DW_WRITE     = 6;
    localparam  ST_DW_TX_ACK    = 7;
    localparam  ST_DR_RX_ADDR   = 8;
    localparam  ST_DR_READ      = 9;
    localparam  ST_DR_TX_ACK    = 10;
    localparam  ST_DR_TX_DATA   = 11;
    localparam  ST_MW_RX_SIZE   = 12;
    localparam  ST_MW_RX_ADDR   = 13;
    localparam  ST_MW_SET_ADDR  = 14;
    localparam  ST_MW_WAI_ADDR  = 15;
    localparam  ST_MW_RX_DATA   = 16;
    localparam  ST_MW_WRITE     = 17;
    localparam  ST_MW_TX_ACK    = 18;
    localparam  ST_MR_RX_SIZE   = 19;
    localparam  ST_MR_RX_ADDR   = 20;
    localparam  ST_MR_TX_ACK    = 21;
    localparam  ST_MR_SET_ADDR  = 22;
    localparam  ST_MR_WAI_ADDR  = 23;
    localparam  ST_MR_READ      = 24;
    localparam  ST_MR_TX_DATA   = 25;
    
    
    reg     [4:0]           state;
    reg     [7:0]           counter;
    
    reg     [7:0]           size;
    reg     [31:0]          address;
    reg     [31:0]          read_data;
    
    
    reg     [3:0]           next_wb_dbg_adr_o;
    reg     [31:0]          next_wb_dbg_dat_o;
    reg                     next_wb_dbg_we_o;
    reg     [3:0]           next_wb_dbg_sel_o;
    reg                     next_wb_dbg_stb_o;
    
    reg     [4:0]           next_state;
    reg     [7:0]           next_counter;
    
    reg     [7:0]           next_size;
    reg     [31:0]          next_address;
    reg     [31:0]          next_read_data;
    
    
    // FF
    always @ ( posedge clk ) begin
        if ( reset ) begin
            wb_dbg_adr_o  <= {4{1'bx}};
            wb_dbg_dat_o  <= {32{1'bx}};
            wb_dbg_we_o   <= 1'bx;
            wb_dbg_sel_o  <= {4{1'bx}};
            wb_dbg_stb_o  <= 1'b0;
            state         <= ST_IDLE;
            counter       <= 0;
            size          <= {8{1'bx}};
            address       <= {32{1'bx}};
            read_data     <= {32{1'bx}};
        end
        else begin
            wb_dbg_adr_o  <= next_wb_dbg_adr_o;
            wb_dbg_dat_o  <= next_wb_dbg_dat_o;
            wb_dbg_we_o   <= next_wb_dbg_we_o;
            wb_dbg_sel_o  <= next_wb_dbg_sel_o;
            wb_dbg_stb_o  <= next_wb_dbg_stb_o;
            state         <= next_state;
            counter       <= next_counter;
            size          <= next_size;
            address       <= next_address;
            read_data     <= next_read_data;
        end
    end
    
    // combination
    always @* begin
        // combination logic
        comm_rx_ready = 1'b0;
        comm_tx_valid    = 1'b0;
        comm_tx_data  = {8{1'bx}};
        
        // sequential logic
        next_state        = state;
        next_counter      = counter;
        next_wb_dbg_adr_o = wb_dbg_adr_o;
        next_wb_dbg_dat_o = wb_dbg_dat_o;
        next_wb_dbg_we_o  = wb_dbg_we_o;
        next_wb_dbg_sel_o = wb_dbg_sel_o;
        next_wb_dbg_stb_o = wb_dbg_stb_o;
        next_size         = size;
        next_address      = address;
        next_read_data    = read_data;
        
        (* parallel_case *) (* full_case *)
        casex ( state )
        
        //  ---- Idle ----
        ST_IDLE: begin
            comm_rx_ready = 1'b1;
            
            // command recive & analyze
            if ( comm_rx_valid ) begin
                case ( comm_rx_data )
                `CMD_NOP:
                    begin
                        next_state = ST_NOP_TX_ACK;
                    end
                
                `CMD_STATUS:
                    begin
                        // go next state
                        next_state = ST_STAT_TX_ACK;
                    end
                
                `CMD_DBG_WRITE:
                    begin
                        // go next state
                        next_state = ST_DW_RX_ADDR;
                    end
                    
                `CMD_DBG_READ:
                    begin
                        // go next state
                        next_state = ST_DR_RX_ADDR;
                    end

                `CMD_MEM_WRIT:
                    begin
                        // go next state
                        next_state = ST_MW_RX_SIZE;
                    end
                    
                `CMD_MEM_READ:
                    begin
                        // go next state
                        next_state = ST_MR_RX_SIZE;
                    end
                endcase
            end
        end
        
                
        // ---- Nop ----
        
        // send ack
        ST_NOP_TX_ACK: begin
            // send ack
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_NOP;
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_IDLE;
            end
        end
        
        
        
        // ---- Status ----
        
        // status ack
        ST_STAT_TX_ACK : begin
            // send status
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_STATUS;
            
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_STAT_TX_STAT;
            end
        end
        
        // send status
        ST_STAT_TX_STAT: begin
            comm_tx_valid   = 1'b1;
            comm_tx_data = endian;
            
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_IDLE;
            end
        end
        
        
        
        // ---- Write debug register ----
        
        // dbg write recv addr
        ST_DW_RX_ADDR: begin
            comm_rx_ready     = 1'b1;
            next_wb_dbg_we_o  = 1'b1;
            next_counter[1:0] = 2'b00;
            
            if ( comm_rx_valid ) begin
                // receive sel & adr
                next_wb_dbg_adr_o = comm_rx_data[3:0];
                next_wb_dbg_sel_o = comm_rx_data[7:4];
                
                // go next state
                next_state = ST_DW_RX_DATA;
            end
        end
        
        // dbg write recv data
        ST_DW_RX_DATA: begin
            comm_rx_ready = 1'b1;
            if ( comm_rx_valid ) begin
                // counter
                next_counter = counter + 1;
                
                // receive data
                if ( counter[1:0] == ({2{endian}} ^ 2'b00) ) next_wb_dbg_dat_o[7:0]   = comm_rx_data;
                if ( counter[1:0] == ({2{endian}} ^ 2'b01) ) next_wb_dbg_dat_o[15:8]  = comm_rx_data;
                if ( counter[1:0] == ({2{endian}} ^ 2'b10) ) next_wb_dbg_dat_o[23:16] = comm_rx_data;
                if ( counter[1:0] == ({2{endian}} ^ 2'b11) ) next_wb_dbg_dat_o[31:24] = comm_rx_data;
                
                if ( counter[1:0] == 2'b11 ) begin
                    // write
                    next_wb_dbg_stb_o = 1'b1;
                    
                    // go next state
                    next_state = ST_DW_WRITE;
                end
            end
        end
        
        // dbg write
        ST_DW_WRITE: begin
            if ( wb_dbg_ack_i ) begin
                // write end
                next_wb_dbg_stb_o = 1'b0;
                                
                // go next state
                next_state = ST_DW_TX_ACK;
            end
        end

        ST_DW_TX_ACK: begin
            // send ack
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_DBG_WRITE;
            
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_IDLE;
            end
        end
        
        
        // ---- Read debug register ----
    
        // dbg read
        ST_DR_RX_ADDR: begin
            comm_rx_ready     = 1'b1;
            
            next_wb_dbg_we_o  = 1'b0;
            next_counter[1:0] = 2'b00;
            
            if ( comm_rx_valid ) begin
                // receive sel & adr
                next_wb_dbg_adr_o = comm_rx_data[3:0];
                next_wb_dbg_sel_o = comm_rx_data[7:4];
                next_wb_dbg_stb_o = 1'b1;
                
                // go next state
                next_state = ST_DR_READ;
            end
        end
        
        // dbg read
        ST_DR_READ: begin
            // read data
            next_read_data = wb_dbg_dat_i;
            
            if ( wb_dbg_ack_i ) begin
                // read
                next_wb_dbg_stb_o = 1'b0;
                                
                // go next state
                next_state = ST_DR_TX_ACK;
            end
        end
        
        ST_DR_TX_ACK: begin
            // send ack
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_DBG_READ;
            
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_DR_TX_DATA;
            end
        end
        
        ST_DR_TX_DATA: begin
            // send data
            comm_tx_valid = 1'b1;
            if ( counter[1:0] == ({2{endian}} ^ 2'b00) )        comm_tx_data = read_data[7:0];
            else if ( counter[1:0] == ({2{endian}} ^ 2'b01) )   comm_tx_data = read_data[15:8];
            else if ( counter[1:0] == ({2{endian}} ^ 2'b10) )   comm_tx_data = read_data[23:16];
            else if ( counter[1:0] == ({2{endian}} ^ 2'b11) )   comm_tx_data = read_data[31:24];
            
            if ( comm_tx_ready ) begin
                next_counter = counter + 1;
                if ( counter[1:0] == 2'b11 ) begin
                    // go to next state
                    next_state = ST_IDLE;
                end
            end
        end
        
        
        
        // ---- Write memory ----
        
        // memory write
        ST_MW_RX_SIZE: begin
            comm_rx_ready     = 1'b1;
            next_counter[1:0] = 2'b00;
            next_size = comm_rx_data;
            
            if ( comm_rx_valid ) begin
                // go next state
                next_state = ST_MW_RX_ADDR;
            end
        end
        
        // mem write recv address
        ST_MW_RX_ADDR: begin
            comm_rx_ready = 1'b1;
            
            // receive data
            if ( counter[1:0] == ({2{endian}} ^ 2'b00) ) next_address[7:0]   = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b01) ) next_address[15:8]  = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b10) ) next_address[23:16] = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b11) ) next_address[31:24] = comm_rx_data;
            
            if ( comm_rx_valid ) begin
                // counter
                next_counter = counter + 1;
                
                if ( counter[1:0] == 2'b11 ) begin                  
                    // go next state
                    next_counter = 0;
                    next_state   = ST_MW_SET_ADDR;
                end
            end
        end
        
        ST_MW_SET_ADDR: begin           
            // write
            next_wb_dbg_adr_o = 4'h2;   // DBG_ADDR
            next_wb_dbg_dat_o = {address[31:2], 2'b00};
            next_wb_dbg_we_o  = 1'b1;
            next_wb_dbg_sel_o = 4'b1111;
            next_wb_dbg_stb_o = 1'b1;
            
            // go next state
            next_state = ST_MW_WAI_ADDR;
        end
        
        ST_MW_WAI_ADDR: begin
            if ( wb_dbg_ack_i ) begin
                // write end
                next_wb_dbg_stb_o = 1'b0;
                
                // go next state
                next_state = ST_MW_RX_DATA;
            end
        end
        
        // recv write data
        ST_MW_RX_DATA: begin
            comm_rx_ready = 1'b1;
            
            next_wb_dbg_adr_o    = 4'h6;    // DBG_DBUS
            next_wb_dbg_dat_o    = {4{comm_rx_data}};
            next_wb_dbg_sel_o[0] = (address[1:0] == ({2{endian}} ^ 2'b00));
            next_wb_dbg_sel_o[1] = (address[1:0] == ({2{endian}} ^ 2'b01));
            next_wb_dbg_sel_o[2] = (address[1:0] == ({2{endian}} ^ 2'b10));
            next_wb_dbg_sel_o[3] = (address[1:0] == ({2{endian}} ^ 2'b11));
            
            if ( comm_rx_valid ) begin
                // write
                next_wb_dbg_stb_o = 1'b1;
                
                // go next state
                next_state = ST_MW_WRITE;
            end
        end
        
        ST_MW_WRITE: begin
            if ( wb_dbg_ack_i ) begin
                // write end
                next_wb_dbg_stb_o = 1'b0;
                                
                next_counter = counter + 1;
                next_address = address + 1;
                
                if ( counter == size ) begin        
                    // go next state
                    next_state = ST_MW_TX_ACK;
                end
                else begin
                    // go next state
                    next_state = ST_MW_SET_ADDR;
                end
            end
        end
        
        ST_MW_TX_ACK: begin
            // send ack
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_MEM_WRIT;
            if ( comm_tx_ready ) begin
                // next state
                next_state = ST_IDLE;
            end
        end
        
        
        //  ---- Memory read ----

        // memory read
        ST_MR_RX_SIZE: begin
            comm_rx_ready     = 1'b1;
            next_counter[1:0] = 2'b00;
            next_size = comm_rx_data;
            
            if ( comm_rx_valid ) begin
                // go next state
                next_state = ST_MR_RX_ADDR;
            end
        end
        
        // mem read recv address
        ST_MR_RX_ADDR: begin
            comm_rx_ready = 1'b1;

            // receive data
            if ( counter[1:0] == ({2{endian}} ^ 2'b00) ) next_address[7:0]   = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b01) ) next_address[15:8]  = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b10) ) next_address[23:16] = comm_rx_data;
            if ( counter[1:0] == ({2{endian}} ^ 2'b11) ) next_address[31:24] = comm_rx_data;
            
            if ( comm_rx_valid ) begin
                // counter
                next_counter = counter + 1;
                
                if ( counter[1:0] == 2'b11 ) begin                  
                    // go next state
                    next_state = ST_MR_TX_ACK;
                end
            end
        end
        
        
        ST_MR_TX_ACK:  begin
            // send ack
            comm_tx_valid   = 1'b1;
            comm_tx_data = `ACK_MEM_READ;
            next_counter = 0;
            
            if ( comm_tx_ready ) begin
                // go next state
                next_state = ST_MR_SET_ADDR;
            end
        end
        
        ST_MR_SET_ADDR: begin   
            // write
            next_wb_dbg_adr_o = 4'h2;   // DBG_ADDR
            next_wb_dbg_dat_o = {address[31:2], 2'b00};
            next_wb_dbg_we_o  = 1'b1;
            next_wb_dbg_sel_o = 4'b1111;
            next_wb_dbg_stb_o = 1'b1;
            
            // go next state
            next_state = ST_MR_WAI_ADDR;
        end
        
        ST_MR_WAI_ADDR: begin
            if ( wb_dbg_ack_i ) begin
                // read start
                next_wb_dbg_adr_o    = 4'h6;    // DBG_DBUS
                next_wb_dbg_we_o     = 1'b0;
                next_wb_dbg_sel_o[0] = (address[1:0] == ({2{endian}} ^ 2'b00));
                next_wb_dbg_sel_o[1] = (address[1:0] == ({2{endian}} ^ 2'b01));
                next_wb_dbg_sel_o[2] = (address[1:0] == ({2{endian}} ^ 2'b10));
                next_wb_dbg_sel_o[3] = (address[1:0] == ({2{endian}} ^ 2'b11));
                
                // go next state
                next_state = ST_MR_READ;
            end
        end
        
        // read
        ST_MR_READ: begin
            next_read_data = wb_dbg_dat_i;
            if ( wb_dbg_ack_i ) begin
                next_wb_dbg_stb_o = 1'b0;
                
                // go next state
                next_state = ST_MR_TX_DATA;
            end
        end
        
        
        ST_MR_TX_DATA: begin
            comm_tx_valid   = 1'b1;
            if ( address[1:0] == ({2{endian}} ^ 2'b00) )        comm_tx_data = read_data[7:0];
            else if ( address[1:0] == ({2{endian}} ^ 2'b01) )   comm_tx_data = read_data[15:8];
            else if ( address[1:0] == ({2{endian}} ^ 2'b10) )   comm_tx_data = read_data[23:16];
            else if ( address[1:0] == ({2{endian}} ^ 2'b11) )   comm_tx_data = read_data[31:24];
            
            if ( comm_tx_ready ) begin
                next_counter = counter + 1;
                next_address = address + 1;
                
                if ( counter == size ) begin                    
                    // go next state
                    next_state = ST_IDLE;
                end
                else begin
                    // go next state
                    next_state = ST_MR_SET_ADDR;
                end
            end
        end
        endcase
    end
    
    
endmodule



`default_nettype wire



// end of file
