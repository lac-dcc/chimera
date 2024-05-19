// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



module jelly_cpu_gpr
    #(
        parameter                           TYPE       = 1,     // 0: clk_x2 dp-ram, 1: dual dp-ram, 2: LUT
        parameter                           DATA_WIDTH = 32,
        parameter                           ADDR_WIDTH = 5
    )
    (
        input   wire                        reset,
        input   wire                        clk,
        input   wire                        clk_x2,
        
        input   wire                        write_en,
        input   wire    [ADDR_WIDTH-1:0]    write_addr,
        input   wire    [DATA_WIDTH-1:0]    write_data,
        
        input   wire                        read0_en,
        input   wire    [ADDR_WIDTH-1:0]    read0_addr,
        output  wire    [DATA_WIDTH-1:0]    read0_data,
        
        input   wire                        read1_en,
        input   wire    [ADDR_WIDTH-1:0]    read1_addr,
        output  wire    [DATA_WIDTH-1:0]    read1_data
    );
    
    localparam  REG_SIZE   = (1 << ADDR_WIDTH);
    
    
    generate
    if ( TYPE == 0 ) begin
        // ---------------------------------
        //  x2 clock DP-RAM
        // ---------------------------------
        
        // clk_dly
        reg     clk_dly;
        always @* begin
            clk_dly = #1 clk;
        end
        
        // phase
        reg                         phase;
        always @ ( posedge clk_x2 ) begin
            phase <= clk_dly;
        end
        
        // dualport ram
        wire                        ram_en0;
        wire                        ram_we0;
        wire    [ADDR_WIDTH-1:0]    ram_addr0;
        wire    [DATA_WIDTH-1:0]    ram_din0;
        wire    [DATA_WIDTH-1:0]    ram_dout0;
        wire                        ram_en1;
        wire                        ram_we1;
        wire    [ADDR_WIDTH-1:0]    ram_addr1;
        wire    [DATA_WIDTH-1:0]    ram_din1;
        wire    [DATA_WIDTH-1:0]    ram_dout1;
        
        jelly_ram_dualport
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .ADDR_WIDTH     (ADDR_WIDTH)
                )
            i_ram_dualport
                (
                    .clk0           (clk_x2),
                    .en0            (ram_en0),
                    .we0            (ram_we0),
                    .addr0          (ram_addr0),
                    .din0           (ram_din0),
                    .dout0          (ram_dout0),
                    
                    .clk1           (clk_x2),
                    .en1            (ram_en1),
                    .we1            (ram_we1),
                    .addr1          (ram_addr1),
                    .din1           (ram_din1),
                    .dout1          (ram_dout1)
                );
        
        assign ram_en0   = (phase == 1'b0) ? read0_en   : write_en;
        assign ram_we0   = (phase == 1'b0) ? 1'b0       : 1'b1;
        assign ram_addr0 = (phase == 1'b0) ? read0_addr : write_addr;
        assign ram_din0  = write_data;
        
        assign ram_en1   = (phase == 1'b0) ? read1_en   : 1'b0;
        assign ram_we1   = (phase == 1'b0) ? 1'b0       : 1'b0;
        assign ram_addr1 = (phase == 1'b0) ? read1_addr : {ADDR_WIDTH{1'b0}};
        assign ram_din1  = {DATA_WIDTH{1'b0}};
        
        reg     [DATA_WIDTH-1:0]    r0_rdata;   
        always @ ( posedge clk ) begin
            if ( reset ) begin
                r0_rdata <= 0;
            end
            else begin
                if ( read0_en ) begin
                    if ( write_en & (read0_addr == write_addr) ) begin
                        r0_rdata <= write_data;
                    end
                    else begin
                        r0_rdata <= ram_dout0;
                    end
                end
            end
        end
        
        reg     [DATA_WIDTH-1:0]    r1_rdata;
        always @ ( posedge clk ) begin
            if ( reset ) begin
                r1_rdata <= 0;
            end
            else begin
                if ( read1_en ) begin
                    if ( write_en & (read1_addr == write_addr) ) begin
                        r1_rdata <= write_data;
                    end
                    else begin
                        r1_rdata <= ram_dout1;
                    end
                end
            end
        end
        
        assign read0_data = r0_rdata;
        assign read1_data = r1_rdata;
        
    end
    else if ( TYPE == 1 ) begin
        // ---------------------------------
        //  Dual DP-RAM (w1 port not support)
        // ---------------------------------
        
        genvar i;
        for ( i = 0; i < 2; i = i + 1 ) begin :dpram
            // dualport ram
            wire                        ram_write_en;
            wire    [ADDR_WIDTH-1:0]    ram_write_addr;
            wire    [DATA_WIDTH-1:0]    ram_write_data;
            
            wire                        ram_read_en;
            wire    [ADDR_WIDTH-1:0]    ram_read_addr;
            wire    [DATA_WIDTH-1:0]    ram_read_data;
            
            jelly_ram_dualport
                    #(
                        .DATA_WIDTH     (DATA_WIDTH),
                        .ADDR_WIDTH     (ADDR_WIDTH),
                        .MEM_SIZE       ((1 << (ADDR_WIDTH)))
                    )
                i_ram_dualport
                    (
                        .clk0           (clk),
                        .en0            (ram_write_en),
                        .regcke0        (1'b0),
                        .we0            (1'b1),
                        .addr0          (ram_write_addr),
                        .din0           (ram_write_data),
                        .dout0          (),
                        
                        .clk1           (clk),
                        .en1            (ram_read_en),
                        .regcke1        (1'b0),
                        .we1            (1'b0),
                        .addr1          (ram_read_addr),
                        .din1           ({DATA_WIDTH{1'b0}}),
                        .dout1          (ram_read_data)
                    );
            
            // write
            assign ram_write_en   = write_en;
            assign ram_write_addr = write_addr;
            assign ram_write_data = write_data;
            
            // write through
            reg                         write_through_hit;
            reg     [DATA_WIDTH-1:0]    write_through_data;
            always @ ( posedge clk ) begin
                if ( ram_read_en ) begin
                    write_through_hit  <= ram_write_en & (ram_write_addr == ram_read_addr); 
                    write_through_data <= ram_write_data;
                end
            end
            
            // read
            if ( i == 0 ) begin
                assign ram_read_en   = read0_en;
                assign ram_read_addr = read0_addr;
                assign read0_data    = write_through_hit ? write_through_data : ram_read_data;
            end
            else begin
                assign ram_read_en   = read1_en;
                assign ram_read_addr = read1_addr;
                assign read1_data    = write_through_hit ? write_through_data : ram_read_data;
            end
        end
    end
    else begin
        
        // ---------------------------------
        //  LUT (w1 port not support)
        // ---------------------------------
        
        reg     [DATA_WIDTH-1:0]    reg_gpr     [0:REG_SIZE-1];
        reg     [DATA_WIDTH-1:0]    reg_read0;
        reg     [DATA_WIDTH-1:0]    reg_read1;
        
        always @ ( posedge clk ) begin
            if ( write_en ) begin
                reg_gpr[write_addr] <= write_data;
            end
            
            if ( read0_en ) begin
                reg_read0 <= write_en & (write_addr == read0_addr) ? write_data : reg_gpr[read0_addr];
            end
                
            if ( read1_en ) begin
                reg_read1 <= write_en & (write_addr == read1_addr) ? write_data : reg_gpr[read1_addr];
            end
        end
        
        assign read0_data = reg_read0;
        assign read1_data = reg_read1;
    end
    endgenerate
    
endmodule



`default_nettype wire



// end of file

