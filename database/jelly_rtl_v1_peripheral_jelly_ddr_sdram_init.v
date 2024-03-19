// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   DDR-SDRAM interface
//
//                                  Copyright (C) 2008-2009 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps


module jelly_ddr_sdram_init
        #(
            parameter                               SIMULATION      = 1'b1,
            parameter                               CLK_RATE        = 10.0,
            parameter                               INIT_WAIT_CYCLE = (200000 + (CLK_RATE - 1)) / CLK_RATE,
            
            parameter                               SDRAM_BA_WIDTH  = 2,
            parameter                               SDRAM_A_WIDTH   = 13
        )
        (
            // system
            input   wire                            reset,
            input   wire                            clk,
            
            // initializing
            output  wire                            initializing,
            
            // DDR-SDRAM
            output  wire                            ddr_sdram_cke,
            output  wire                            ddr_sdram_cs,
            output  wire                            ddr_sdram_ras,
            output  wire                            ddr_sdram_cas,
            output  wire                            ddr_sdram_we,
            output  wire    [SDRAM_BA_WIDTH-1:0]    ddr_sdram_ba,
            output  wire    [SDRAM_A_WIDTH-1:0]     ddr_sdram_a
        );
    
    // initialize state
    localparam  INIT_ST_WAIT     = 0;
    localparam  INIT_ST_CKE      = 1;
    localparam  INIT_ST_PALL1    = 2;
    localparam  INIT_ST_EMRS     = 3;
    localparam  INIT_ST_MRS1     = 4;
    localparam  INIT_ST_PALL2    = 5;
    localparam  INIT_ST_REFRESH1 = 6;
    localparam  INIT_ST_REFRESH2 = 7;
    localparam  INIT_ST_MRS2     = 8;
    
    reg                         reg_init;   
    reg     [3:0]               reg_state;
    reg     [15:0]              reg_counter;
    reg                         reg_count_end;
    
    reg                         reg_cke;
    reg                         reg_cs;
    reg                         reg_ras;
    reg                         reg_cas;
    reg                         reg_we;
    reg     [1:0]               reg_ba;
    reg     [12:0]              reg_a;

    
    reg                         next_init;  
    reg     [3:0]               next_state;
    reg     [15:0]              next_counter;
    reg                         next_count_end;
    
    reg                         next_cke;
    reg                         next_cs;
    reg                         next_ras;
    reg                         next_cas;
    reg                         next_we;
    reg     [1:0]               next_ba;
    reg     [12:0]              next_a;
    
    
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_init      <= 1'b1;
            reg_state     <= INIT_ST_WAIT;
            reg_counter   <= SIMULATION ? 100 : INIT_WAIT_CYCLE;
            reg_count_end <= 1'b0;
            
            reg_cke       <= 1'b0;
            reg_cs        <= 1'b0;
            reg_ras       <= 1'b1;
            reg_cas       <= 1'b1;
            reg_we        <= 1'b1;
            reg_ba        <= {SDRAM_BA_WIDTH{1'b0}};
            reg_a         <= {SDRAM_A_WIDTH{1'b0}};
        end
        else begin
            if ( reg_init ) begin
                reg_init      <= next_init;
                reg_state     <= next_state;
                reg_counter   <= next_counter;
                reg_count_end <= next_count_end;
                              
                reg_cke       <= next_cke;
                reg_cs        <= next_cs;
                reg_ras       <= next_ras;
                reg_cas       <= next_cas;
                reg_we        <= next_we;
                reg_ba        <= next_ba;
                reg_a         <= next_a;
            end
        end
    end
    
    
    always @* begin
        next_init       = 1'b1;
        next_state      = reg_state;
        next_counter    = reg_counter - 1;
        next_count_end  = (reg_counter == 1);

        next_cke        = reg_cke;
        next_cs         = 1'b0;
        next_ras        = 1'b1;
        next_cas        = 1'b1;
        next_we         = 1'b1;
        next_ba         = {SDRAM_BA_WIDTH{1'bx}};
        next_a          = {SDRAM_A_WIDTH{1'bx}};
        
        case ( reg_state )
        INIT_ST_WAIT: begin
            if ( reg_count_end ) begin
                next_counter = 40;
                next_cke     = 1'b1;
                next_state   = INIT_ST_CKE ;
            end
        end
            
        INIT_ST_CKE: begin
            if ( reg_count_end ) begin
                // PALL
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b1;
                next_we      = 1'b0;
                next_a[10]   = 1'b1;

                // next state
                next_counter = 40;
                next_state   = INIT_ST_PALL1;                       
            end
        end
            
        INIT_ST_PALL1: begin
            if ( reg_count_end ) begin
                // EMRS
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b0;
                next_we      = 1'b0;
                next_ba[1:0] = 2'b01;
                next_a[10]   = 1'b0;
                next_a[9:0]  = 10'b00_000_0_000;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_EMRS;
            end
        end

        INIT_ST_EMRS: begin
            if ( reg_count_end ) begin
                // MRS (DLL reset)
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b0;
                next_we      = 1'b0;
                next_ba[1:0] = 2'b00;
                next_a[10]   = 1'b0;
                next_a[9:0]  = 10'b10_010_0_001;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_MRS1;
            end
        end
            
        INIT_ST_MRS1: begin
            if ( reg_count_end ) begin
                // PALL
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b1;
                next_we      = 1'b0;
                next_a[10]   = 1'b1;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_PALL2;
            end
        end
                
        INIT_ST_PALL2: begin
            if ( reg_count_end ) begin
                // REF
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b0;
                next_we      = 1'b1;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_REFRESH1;
            end
        end

        INIT_ST_REFRESH1: begin
            if ( reg_count_end ) begin
                // REF
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b0;
                next_we      = 1'b1;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_REFRESH2;
            end
        end

        INIT_ST_REFRESH2: begin
            if ( reg_count_end ) begin
                // MRS
                next_cs      = 1'b0;
                next_ras     = 1'b0;
                next_cas     = 1'b0;
                next_we      = 1'b0;
                next_ba[1:0] = 2'b00;
                next_a[10]   = 1'b0;
                next_a[9:0]  = 10'b00_010_0_001;
                        
                // next state
                next_counter = 40;
                next_state   = INIT_ST_MRS2;
            end
        end
        
        INIT_ST_MRS2: begin
            if ( reg_count_end ) begin
                next_init = 1'b0;
            end
        end
        endcase
    end
    
    assign initializing   = reg_init;
    
    assign ddr_sdram_cke  = reg_cke;
    assign ddr_sdram_cs   = reg_cs;
    assign ddr_sdram_ras  = reg_ras;
    assign ddr_sdram_cas  = reg_cas;
    assign ddr_sdram_we   = reg_we;
    assign ddr_sdram_ba   = reg_ba;
    assign ddr_sdram_a    = reg_a;
    
endmodule

