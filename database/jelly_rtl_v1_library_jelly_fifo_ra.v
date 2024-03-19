// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// FIFO (random access)
module jelly_fifo_ra
        #(
            parameter   DATA_WIDTH     = 8,
            parameter   ADDR_WIDTH     = 9,
            parameter   DOUT_REGS      = 1,
            parameter   RAM_TYPE       = "block",
            parameter   FIFO_PTR_WIDTH = ADDR_WIDTH+1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            wr_en,
            input   wire                            wr_we,
            input   wire    [ADDR_WIDTH-1:0]        wr_addr,
            input   wire    [DATA_WIDTH-1:0]        wr_data,
            
            output  reg     [FIFO_PTR_WIDTH-1:0]    wr_ptr,
            input   wire    [FIFO_PTR_WIDTH-1:0]    wr_ptr_next,
            input   wire                            wr_ptr_update,
            
            
            input   wire                            rd_en,
            input   wire    [ADDR_WIDTH-1:0]        rd_addr,
            input   wire                            rd_regcke,
            output  wire    [DATA_WIDTH-1:0]        rd_data,
            
            output  reg     [FIFO_PTR_WIDTH-1:0]    rd_ptr,
            input   wire    [FIFO_PTR_WIDTH-1:0]    rd_ptr_next,
            input   wire                            rd_ptr_update,
            
            output  reg                             full,
            output  reg                             empty,
            output  reg     [FIFO_PTR_WIDTH-1:0]    free_count,
            output  reg     [FIFO_PTR_WIDTH-1:0]    data_count,
            
            output  reg                             next_full,
            output  reg                             next_empty,
            output  reg     [FIFO_PTR_WIDTH-1:0]    next_free_count,
            output  reg     [FIFO_PTR_WIDTH-1:0]    next_data_count
        );
    
    
    // ---------------------------------
    //  RAM
    // ---------------------------------
    
    // ram
    jelly_ram_simple_dualport
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DOUT_REGS      (DOUT_REGS),
                .RAM_TYPE       (RAM_TYPE)
            )
        j_ram_simple_dualport
            (
                .wr_clk         (clk),
                .wr_en          (wr_en),
                .wr_addr        (wr_addr),
                .wr_din         (wr_data),
                
                .rd_clk         (clk),
                .rd_en          (rd_en),
                .rd_regcke      (rd_regcke),
                .rd_addr        (rd_addr),
                .rd_dout        (rd_data)
            );
    
    /*
    jelly_ram_dualport
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DOUT_REGS1     (DOUT_REGS),
                .RAM_TYPE       (RAM_TYPE)
            )
        i_ram_dualport
            (
                .clk0           (clk),
                .en0            (wr_en),
                .regcke0        (1'b0),
                .we0            (wr_we),
                .addr0          (wr_addr),
                .din0           (wr_data),
                .dout0          (),
                
                .clk1           (clk),
                .en1            (rd_en),
                .regcke1        (rd_regcke),
                .we1            (1'b0),
                .addr1          (rd_addr),
                .din1           ({DATA_WIDTH{1'b0}}),
                .dout1          (rd_data)
            );
    */
    
    
    // ---------------------------------
    //  FIFO pointer
    // ---------------------------------
    
    /*
    always @ ( posedge clk ) begin
        if ( reset ) begin
            wr_ptr     <= 0;
            rd_ptr     <= 0;
            
            full       <= 1'b1;
            empty      <= 1'b1;
            free_count <= 0;
            data_count <= 0;
            
    //      full       <= 1'b0;
    //      empty      <= 1'b1;
    //      free_count <= (1'b1 << ADDR_WIDTH);
    //      data_count <= 0;
        end
        else begin
            case ( {rd_ptr_update, wr_ptr_update} )
            2'b00:
                begin
                    wr_ptr     <= wr_ptr;
                    rd_ptr     <= rd_ptr;
                    
                    full       <= (wr_ptr[FIFO_PTR_WIDTH-1] != rd_ptr[FIFO_PTR_WIDTH-1]) && (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);
                    empty      <= (wr_ptr == rd_ptr);
                    data_count <= (wr_ptr - rd_ptr);
                    free_count <= ((rd_ptr - wr_ptr) + (1'b1 << ADDR_WIDTH));

    //              full       <= full;
    //              empty      <= empty;
    //              free_count <= free_count;
    //              data_count <= data_count;
                end
            
            2'b01:
                begin
                    wr_ptr     <= wr_ptr_next;
                    rd_ptr     <= rd_ptr;
                    full       <= (wr_ptr_next[FIFO_PTR_WIDTH-1] != rd_ptr[FIFO_PTR_WIDTH-1]) && (wr_ptr_next[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);
                    empty      <= (wr_ptr_next == rd_ptr);
                    data_count <= (wr_ptr_next - rd_ptr);
                    free_count <= ((rd_ptr - wr_ptr_next) + (1'b1 << ADDR_WIDTH));
                end
                
            2'b10:
                begin
                    wr_ptr     <= wr_ptr;
                    rd_ptr     <= rd_ptr_next;
                    full       <= (wr_ptr[FIFO_PTR_WIDTH-1] != rd_ptr_next[FIFO_PTR_WIDTH-1]) && (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr_next[ADDR_WIDTH-1:0]);
                    empty      <= (wr_ptr == rd_ptr_next);
                    data_count <= (wr_ptr - rd_ptr_next);
                    free_count <= ((rd_ptr_next - wr_ptr) + (1'b1 << ADDR_WIDTH));
                end
            
                
            2'b11:
                begin
                    wr_ptr     <= wr_ptr_next;
                    rd_ptr     <= rd_ptr_next;
                    full       <= (wr_ptr_next[FIFO_PTR_WIDTH-1] != rd_ptr_next[FIFO_PTR_WIDTH-1]) && (wr_ptr_next[ADDR_WIDTH-1:0] == rd_ptr_next[ADDR_WIDTH-1:0]);
                    empty      <= (wr_ptr_next == rd_ptr_next);
                    data_count <= (wr_ptr_next - rd_ptr_next);
                    free_count <= ((rd_ptr_next - wr_ptr_next) + (1'b1 << ADDR_WIDTH));
                end
            endcase
        end
    end
    */
    
    
    
    // write
    reg     [FIFO_PTR_WIDTH-1:0]    next_wr_ptr;
    reg     [FIFO_PTR_WIDTH-1:0]    next_rd_ptr;
//  reg                             next_full;
//  reg                             next_empty;
//  reg     [FIFO_PTR_WIDTH-1:0]    next_free_count;
//  reg     [FIFO_PTR_WIDTH-1:0]    next_data_count;
    
    /*
    always @* begin
        next_wr_ptr     = wr_ptr;
        next_rd_ptr     = rd_ptr;
        next_full       = full;
        next_empty      = empty;
        next_data_count = data_count;
        next_free_count = free_count;
        
        if ( wr_ptr_update ) begin
            next_wr_ptr = wr_ptr_next;
        end
        
        if ( rd_ptr_update ) begin
            next_rd_ptr = rd_ptr_next;
        end
        
        next_full       = (next_wr_ptr[FIFO_PTR_WIDTH-1] != next_rd_ptr[FIFO_PTR_WIDTH-1]) && (next_wr_ptr[ADDR_WIDTH-1:0] == next_rd_ptr[ADDR_WIDTH-1:0]);
        next_empty      = (next_wr_ptr == next_rd_ptr);
        next_data_count = (next_wr_ptr - next_rd_ptr);
        next_free_count = ((next_rd_ptr - next_wr_ptr) + (1'b1 << ADDR_WIDTH));
    end
    */
    
    always @* begin
        next_wr_ptr     = wr_ptr;
        next_rd_ptr     = rd_ptr;
        next_full       = full;
        next_empty      = empty;
        next_data_count = data_count;
        next_free_count = free_count;
        
        case ( {rd_ptr_update, wr_ptr_update} )
        2'b00:
            begin
                next_wr_ptr     = wr_ptr;
                next_rd_ptr     = rd_ptr;
                next_full       = (wr_ptr[FIFO_PTR_WIDTH-1] != rd_ptr[FIFO_PTR_WIDTH-1]) && (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);
                next_empty      = (wr_ptr == rd_ptr);
                next_data_count = (wr_ptr - rd_ptr);
                next_free_count = ((rd_ptr - wr_ptr) + (1'b1 << ADDR_WIDTH));
            end
        
        2'b01:
            begin
                next_wr_ptr     = wr_ptr_next;
                next_rd_ptr     = rd_ptr;
                next_full       = (wr_ptr_next[FIFO_PTR_WIDTH-1] != rd_ptr[FIFO_PTR_WIDTH-1]) && (wr_ptr_next[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);
                next_empty      = (wr_ptr_next == rd_ptr);
                next_data_count = (wr_ptr_next - rd_ptr);
                next_free_count = ((rd_ptr - wr_ptr_next) + (1'b1 << ADDR_WIDTH));
            end
        
        2'b10:
            begin
                next_wr_ptr     = wr_ptr;
                next_rd_ptr     = rd_ptr_next;
                next_full       = (wr_ptr[FIFO_PTR_WIDTH-1] != rd_ptr_next[FIFO_PTR_WIDTH-1]) && (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr_next[ADDR_WIDTH-1:0]);
                next_empty      = (wr_ptr == rd_ptr_next);
                next_data_count = (wr_ptr - rd_ptr_next);
                next_free_count = ((rd_ptr_next - wr_ptr) + (1'b1 << ADDR_WIDTH));
            end
        
        2'b11:
            begin
                next_wr_ptr     = wr_ptr_next;
                next_rd_ptr     = rd_ptr_next;
                next_full       = (wr_ptr_next[FIFO_PTR_WIDTH-1] != rd_ptr_next[FIFO_PTR_WIDTH-1]) && (wr_ptr_next[ADDR_WIDTH-1:0] == rd_ptr_next[ADDR_WIDTH-1:0]);
                next_empty      = (wr_ptr_next == rd_ptr_next);
                next_data_count = (wr_ptr_next - rd_ptr_next);
                next_free_count      = ((rd_ptr_next - wr_ptr_next) + (1'b1 << ADDR_WIDTH));
            end
        endcase
    end
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            wr_ptr     <= 0;
            rd_ptr     <= 0;
            full       <= 1'b1;
            empty      <= 1'b1;
            free_count <= 0;
            data_count <= 0;
        end
        else begin
            wr_ptr     <= next_wr_ptr;
            rd_ptr     <= next_rd_ptr;
            full       <= next_full;
            empty      <= next_empty;
            free_count <= next_free_count;
            data_count <= next_data_count;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
