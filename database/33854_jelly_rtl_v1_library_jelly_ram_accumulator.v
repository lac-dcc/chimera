// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// accumulator memory
module jelly_ram_accumulator
        #(
            parameter   ADDR_WIDTH   = 10,
            parameter   DATA_WIDTH   = 18,
            parameter   MEM_SIZE     = (1 << ADDR_WIDTH),
            parameter   RAM_TYPE     = "block",
            
            parameter   FILLMEM      = 0,
            parameter   FILLMEM_DATA = 0,
            parameter   READMEMB     = 0,
            parameter   READMEMH     = 0,
            parameter   READMEM_FIlE = ""
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            // accumulator port
            input   wire    [ADDR_WIDTH-1:0]    acc_addr,
            input   wire    [DATA_WIDTH-1:0]    acc_data,
            input   wire    [0:0]               acc_operation,  // 0:add, 1:subtraction
            input   wire                        acc_valid,
            
            // memory port (exclusive acc port)
            input   wire                        mem_en,
            input   wire                        mem_we,
            input   wire    [ADDR_WIDTH-1:0]    mem_addr,
            input   wire    [DATA_WIDTH-1:0]    mem_din,
            output  wire    [DATA_WIDTH-1:0]    mem_dout,
            
            // max
            input   wire                        max_clear,
            output  wire    [ADDR_WIDTH-1:0]    max_addr,
            output  wire    [DATA_WIDTH-1:0]    max_data
        );
    
    reg                         st0_we;
    reg     [ADDR_WIDTH-1:0]    st0_addr;
    reg     [DATA_WIDTH-1:0]    st0_din;
    reg     [DATA_WIDTH-1:0]    st0_data;
    reg     [0:0]               st0_operation;
    reg                         st0_valid;
    
    reg                         st1_fw_st2;
    reg                         st1_fw_st3;
    reg     [ADDR_WIDTH-1:0]    st1_addr;
    reg     [DATA_WIDTH-1:0]    st1_data;
    reg     [0:0]               st1_operation;
    reg                         st1_valid;
    
    wire    [DATA_WIDTH-1:0]    st1_dout;
    reg     [DATA_WIDTH-1:0]    st1_rdata;
    
    reg                         st2_we;
    reg     [ADDR_WIDTH-1:0]    st2_addr;
    reg     [DATA_WIDTH-1:0]    st2_data;
    reg                         st2_valid;
    
    reg     [DATA_WIDTH-1:0]    st3_data;
    
    
    // fowarding
    always @* begin
        st1_rdata = st1_dout;
        if ( st1_fw_st3 ) begin st1_rdata = st3_data; end
        if ( st1_fw_st2 ) begin st1_rdata = st2_data; end
    end
    
    // pipeline
    always @(posedge clk) begin
        if ( reset ) begin
            st0_we        <= 1'bx;
            st0_addr      <= {ADDR_WIDTH{1'bx}};
            st0_data      <= {DATA_WIDTH{1'bx}};
            st0_operation <= 1'bx;
            st0_valid     <= 1'b0;
            
            st1_fw_st2    <= 1'bx;
            st1_fw_st3    <= 1'bx;
            st1_addr      <= {ADDR_WIDTH{1'bx}};
            st1_data      <= {DATA_WIDTH{1'bx}};
            st1_operation <= 1'bx;
            st1_valid     <= 1'b0;
            
            st2_we        <= 1'b0;
            st2_addr      <= {ADDR_WIDTH{1'bx}};
            st2_data      <= {DATA_WIDTH{1'bx}};
            st2_valid     <= 1'b0;
            
            st3_data      <= {DATA_WIDTH{1'bx}};
        end
        else if ( cke ) begin
            // stage 0
            st0_we        <= mem_en ? mem_we   : 1'b0;
            st0_addr      <= mem_en ? mem_addr : acc_addr;
            st0_din       <= mem_din;
            st0_data      <= acc_data;
            st0_operation <= acc_operation;
            st0_valid     <= mem_en ? 1'b0     : acc_valid;
            
            // stage 1
            st1_fw_st2    <= st0_valid && st1_valid && (st0_addr == st1_addr);
            st1_fw_st3    <= st0_valid && st2_valid && (st0_addr == st2_addr);
            st1_addr      <= st0_addr;
            st1_data      <= st0_data;
            st1_operation <= st0_operation;
            st1_valid     <= st0_valid;
            
            // stage 2
            st2_we        <= st1_valid;
            st2_addr      <= st1_addr;
            st2_data      <= (st1_operation == 1'b0) ? st1_rdata + st1_data : st1_rdata - st1_data;
            st2_valid     <= st1_valid;
            
            // stage 3
            st3_data      <= st2_data;
        end
    end
    
    
    // memory
    jelly_ram_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .MEM_SIZE       (MEM_SIZE),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS0     (0),
                .DOUT_REGS1     (0),
                
                .FILLMEM        (FILLMEM),
                .FILLMEM_DATA   (FILLMEM_DATA),
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FIlE   (READMEM_FIlE)
            )
        i_ram_dualport
            (
                .clk0           (clk),
                .en0            (cke),
                .regcke0        (cke),
                .we0            (st0_we),
                .addr0          (st0_addr),
                .din0           (st0_din),
                .dout0          (st1_dout),
                
                .clk1           (clk),
                .en1            (cke),
                .regcke1        (cke),
                .we1            (st2_we),
                .addr1          (st2_addr),
                .din1           (st2_data),
                .dout1          ()
            );
    
    assign mem_dout = st1_dout;
    
    
    // max
    reg     [ADDR_WIDTH-1:0]    reg_max_addr;
    reg     [DATA_WIDTH-1:0]    reg_max_data;
    always @(posedge clk) begin
        if ( reset || max_clear ) begin
            reg_max_addr <= {ADDR_WIDTH{1'b0}};
            reg_max_data <= {DATA_WIDTH{1'b0}};
        end
        else begin
            if ( st2_we && (st2_data > reg_max_data) ) begin
                reg_max_addr <= st2_addr;
                reg_max_data <= st2_data;
            end
        end
    end
    
    assign max_addr = reg_max_addr;
    assign max_data = reg_max_data;
    
    
    
endmodule


`default_nettype wire


// End of file
