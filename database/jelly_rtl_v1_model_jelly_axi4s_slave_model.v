// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_slave_model
        #(
            parameter   COMPONENT_NUM    = 3,
            parameter   DATA_WIDTH       = 8,
            parameter   AXI4S_DATA_WIDTH = COMPONENT_NUM*DATA_WIDTH,
            parameter   INIT_FRAME_NUM   = 0,
            parameter   FRAME_WIDTH      = 32,
            parameter   X_WIDTH          = 32,
            parameter   Y_WIDTH          = 32,
            parameter   FILE_NAME        = "img_%04d.ppm",
            parameter   MAX_PATH         = 64,
            parameter   BUSY_RATE        = 0,
            parameter   RANDOM_SEED      = 1234
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire    [X_WIDTH-1:0]           param_width,
            input   wire    [Y_WIDTH-1:0]           param_height,
            output  reg     [FRAME_WIDTH-1:0]       frame_num,

            input   wire    [0:0]                   s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [AXI4S_DATA_WIDTH-1:0]  s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready
        );
    
    
    integer                         i;
    integer                         fp = 0;
    reg     [MAX_PATH*8-1:0]        file_path;
    
    initial begin
        frame_num = INIT_FRAME_NUM;
    end
    
    always @(posedge aclk) begin
        if ( aresetn && aclken ) begin
            if ( s_axi4s_tvalid && s_axi4s_tready ) begin
                if ( s_axi4s_tuser[0] ) begin
                    // frame start
                    if ( fp != 0 ) begin
                        $fclose(fp);
                        frame_num = frame_num + 1;
                    end
                    $sformat(file_path, FILE_NAME, frame_num);
                    $display("write:%0s", file_path);
                    fp = $fopen(file_path, "w");
                    if ( fp != 0 ) begin
                        if ( COMPONENT_NUM == 3 ) begin
                            $fdisplay(fp, "P3");
                        end
                        else begin
                            $fdisplay(fp, "P2");
                        end
                        $fdisplay(fp, "%0d %0d", param_width, param_height);
                        $fdisplay(fp, "%0d", (1 << DATA_WIDTH)-1);
                    end
                end
                
                if ( fp != 0 ) begin
                    for ( i = 0; i < COMPONENT_NUM; i = i+1 ) begin
                         $fwrite(fp, "%d ", s_axi4s_tdata[i*DATA_WIDTH +: DATA_WIDTH]);
                    end
                    $fdisplay(fp, "");
                end
            end
        end
    end
    
    
    wire                busy;
    generate
    if ( BUSY_RATE > 0 ) begin : blk_busy
        reg     [31:0]      reg_rand_seed = RANDOM_SEED;
        reg     [31:0]      reg_rand;
        always @( posedge aclk ) begin
            if ( !aresetn ) begin
                reg_rand_seed <= RANDOM_SEED;
                reg_rand      <= 99;
            end
            else begin
                reg_rand      <= {$random(reg_rand_seed)};
            end
        end
        assign  busy = ((reg_rand % 100) < BUSY_RATE);
    end
    else begin : blk_no_busy
        assign  busy = 0;
    end
    endgenerate
    
    assign s_axi4s_tready = !busy;
    
    
endmodule


`default_nettype wire


// end of file
