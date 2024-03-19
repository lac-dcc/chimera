// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// debug comm
module jelly_ezusbfx2_to_comm
        #(
            parameter   DATA_WIDTH         = 8,
            parameter   FX2_EMPTY_NEGATIVE = 1,
            parameter   FX2_FULL_NEGATIVE  = 1,
            parameter   FX2_SLWR_NEGATIVE  = 1,
            parameter   FX2_SLRD_NEGATIVE  = 1,
            parameter   FX2_SLOE_NEGATIVE  = 1,
            parameter   FX2_FADDR_RD       = 2'b00,
            parameter   FX2_FADDR_WR       = 2'b10
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // EZ-USB FX2
            input   wire                        fx2_empty,
            input   wire                        fx2_full,
            output  wire                        fx2_slwr,
            output  wire                        fx2_slrd,
            output  wire                        fx2_sloe,
            output  wire                        fx2_pktend,
            output  wire    [1:0]               fx2_faddr,
            output  wire    [DATA_WIDTH-1:0]    fx2_fd_t,   
            output  wire    [DATA_WIDTH-1:0]    fx2_fd_o,
            input   wire    [DATA_WIDTH-1:0]    fx2_fd_i,
            
            
            // comm port
            input   wire    [DATA_WIDTH-1:0]    comm_tx_data,
            input   wire                        comm_tx_valid,
            output  wire                        comm_tx_ready,
            output  wire    [DATA_WIDTH-1:0]    comm_rx_data,
            output  wire                        comm_rx_valid,
            input   wire                        comm_rx_ready
        );
    
    assign fx2_pktend = 1'b0;
    
    // state
    localparam  [1:0]   STATE_IDLE = 2'b00, STATE_WRITE = 2'b01, STATE_READ = 2'b10; 
    reg         [1:0]   reg_state;

    
    // flag
    wire                        flag_empty;
    wire                        flag_full;
    assign flag_empty = FX2_EMPTY_NEGATIVE ? ~fx2_empty : fx2_empty;
    assign flag_full  = FX2_FULL_NEGATIVE  ? ~fx2_full  : fx2_full;
    
    // FX2 I/F
    (* IOB="TRUE" *)    reg                         reg_slwr;
    (* IOB="TRUE" *)    reg                         reg_slrd;
    (* IOB="TRUE" *)    reg                         reg_sloe;
    (* IOB="TRUE" *)    reg     [1:0]               reg_faddr;
    (* IOB="TRUE" *)    reg     [DATA_WIDTH-1:0]    reg_fd_t;   
    (* IOB="TRUE" *)    reg     [DATA_WIDTH-1:0]    reg_fd_o;
    (* IOB="TRUE" *)    reg     [DATA_WIDTH-1:0]    reg_fd_i;
    
    // comm I/F
    reg                         reg_tx_ready;
    
    reg     [DATA_WIDTH-1:0]    reg_rx_data;
    reg                         reg_rx_valid;

    reg                         reg_rd_valid;

    reg     [DATA_WIDTH-1:0]    reg_buf_data;
    reg                         reg_buf_valid;
    
    assign fx2_slwr  = FX2_SLWR_NEGATIVE ? (reg_slwr | flag_full)  : (reg_slwr & ~flag_full);
    assign fx2_slrd  = FX2_SLRD_NEGATIVE ? (reg_slrd | flag_empty) : (reg_slwr & ~flag_empty); 
    assign fx2_sloe  = reg_sloe;
    assign fx2_faddr = reg_faddr;
    assign fx2_fd_t  = reg_fd_t;
    assign fx2_fd_o  = reg_fd_o;
    
    assign comm_tx_ready = (reg_state == STATE_WRITE || reg_state == STATE_IDLE) & !flag_full;
    assign comm_rx_data  = reg_rx_data;
    assign comm_rx_valid = reg_rx_valid;
    
    
    always @(posedge clk or posedge reset) begin
        if ( reset ) begin
            reg_state     <= STATE_IDLE;
            
            reg_slwr      <= FX2_SLWR_NEGATIVE ? 1'b1 : 1'b0;
            reg_slrd      <= FX2_SLRD_NEGATIVE ? 1'b1 : 1'b0;
            reg_sloe      <= FX2_SLOE_NEGATIVE ? 1'b1 : 1'b0;
            reg_faddr     <= 2'bxx;
            reg_fd_t      <= {DATA_WIDTH{1'b1}};
            reg_fd_o      <= {DATA_WIDTH{1'b0}};
            reg_fd_i      <= {DATA_WIDTH{1'b0}};
            
            reg_tx_ready  <= 1'b0;
            reg_rx_data   <= {DATA_WIDTH{1'b0}};
            reg_rx_valid  <= 1'b0;
            
            reg_rd_valid  <= 1'b0;
            reg_buf_data  <= {DATA_WIDTH{1'b0}};
            reg_buf_valid <= 1'b0;

        end
        else begin
            // state machine
            case ( reg_state )
            STATE_IDLE:
                begin
                    if ( comm_tx_valid & ~flag_full ) begin
                        reg_state    <= STATE_WRITE;
                        reg_tx_ready <= 1'b1;
                        reg_faddr    <= FX2_FADDR_WR;
                        reg_slwr     <= FX2_SLWR_NEGATIVE ? 1'b0 : 1'b1;
                        reg_slrd     <= FX2_SLRD_NEGATIVE ? 1'b1 : 1'b0;
                        reg_sloe     <= FX2_SLOE_NEGATIVE ? 1'b1 : 1'b0;
                        reg_fd_t     <= {DATA_WIDTH{1'b0}};
                        reg_fd_o     <= comm_tx_data;                       
                    end
                    else if ( ~flag_empty & ~reg_rd_valid & ~reg_buf_valid & ~comm_rx_valid ) begin
                        reg_state    <= STATE_READ;
                        reg_faddr    <= FX2_FADDR_RD;
                        reg_slwr     <= FX2_SLWR_NEGATIVE ? 1'b1 : 1'b0;
                        reg_slrd     <= FX2_SLRD_NEGATIVE ? 1'b0 : 1'b1;
                        reg_sloe     <= FX2_SLOE_NEGATIVE ? 1'b0 : 1'b1;
                    end
                end
            
            STATE_WRITE:
                begin
                    if ( !(comm_tx_valid & comm_tx_ready) & !flag_full ) begin
                        reg_state    <= STATE_IDLE;
                        reg_faddr    <= FX2_FADDR_RD;
                        reg_tx_ready <= 1'b0;
                        reg_slwr     <= FX2_SLWR_NEGATIVE ? 1'b1 : 1'b0;
                        reg_slrd     <= FX2_SLRD_NEGATIVE ? 1'b1 : 1'b0;
                        reg_sloe     <= FX2_SLOE_NEGATIVE ? 1'b1 : 1'b0;
                        reg_fd_t     <= {DATA_WIDTH{1'b1}};
                    end
                    else begin
                        reg_tx_ready <= !flag_full;
                        if ( comm_tx_ready ) begin
                            reg_fd_o <= comm_tx_data;
                        end
                    end
                end
                
            STATE_READ:
                begin
                    if ( flag_empty | comm_tx_valid | (comm_rx_valid & !comm_rx_ready) ) begin
                        reg_state <= STATE_IDLE;
                        reg_slwr  <= FX2_SLWR_NEGATIVE ? 1'b1 : 1'b0;
                        reg_slrd  <= FX2_SLRD_NEGATIVE ? 1'b1 : 1'b0;
                        reg_sloe  <= FX2_SLOE_NEGATIVE ? 1'b1 : 1'b0;
                    end
                end
            endcase
            
            // read data
            if ( (reg_state == STATE_READ) & ~flag_empty ) begin
                reg_rd_valid <= 1'b1;
                reg_fd_i     <= fx2_fd_i;
            end
            else if ( comm_rx_ready | !reg_rx_valid | !reg_buf_valid ) begin
                reg_rd_valid <= 1'b0;
            end
            
            // buf
            if ( (!reg_buf_valid & comm_rx_valid & !comm_rx_ready) | (reg_buf_valid & comm_rx_ready) ) begin
                reg_buf_valid <= reg_rd_valid;
                reg_buf_data  <= reg_fd_i;
            end
            
            // comm_rx
            if ( !comm_rx_valid | comm_rx_ready ) begin
                if ( reg_buf_valid ) begin
                    reg_rx_valid <= reg_buf_valid;
                    reg_rx_data  <= reg_buf_data;
                end
                else begin
                    reg_rx_valid <= reg_rd_valid;
                    reg_rx_data  <= reg_fd_i;
                end
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
