// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_mipi_ecc24();
    localparam RATE = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_mipi_ecc24.vcd");
        $dumpvars(0, tb_mipi_ecc24);
    
    #20000
        $finish;
    end
    
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     cke = 1'b1;
    
    
    reg     [24+1+1+6+24-1:0]     mem  [0:50];
    
    initial begin
        mem[0]  = {24'h00_da_01, 1'b0, 1'b0, 6'h1e, 24'h00_da_01};
        mem[1]  = {24'h00_db_00, 1'b0, 1'b0, 6'h03, 24'h00_db_00};
        mem[2]  = {24'h03_20_12, 1'b0, 1'b0, 6'h32, 24'h03_20_12};
        mem[3]  = {24'h03_20_12, 1'b0, 1'b0, 6'h32, 24'h03_20_12};
        mem[4]  = {24'h03_20_2b, 1'b0, 1'b0, 6'h3d, 24'h03_20_2b};
        mem[5]  = {24'h00_67_01, 1'b0, 1'b0, 6'h21, 24'h00_67_01};
        mem[6]  = {24'h00_68_00, 1'b0, 1'b0, 6'h26, 24'h00_68_00};
        
        mem[7]  = {24'h00_da_01, 1'b1, 1'b1, 6'h1e, 24'h00_da_01} ^ 30'h00_000001;
        mem[8]  = {24'h00_db_00, 1'b1, 1'b1, 6'h03, 24'h00_db_00} ^ 30'h00_000002;
        mem[9]  = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_000004;
        mem[10] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_000008;
        mem[11] = {24'h03_20_2b, 1'b1, 1'b1, 6'h3d, 24'h03_20_2b} ^ 30'h00_000010;
        mem[12] = {24'h00_67_01, 1'b1, 1'b1, 6'h21, 24'h00_67_01} ^ 30'h00_000020;
        mem[13] = {24'h00_68_00, 1'b1, 1'b1, 6'h26, 24'h00_68_00} ^ 30'h00_000040;
        mem[14] = {24'h00_da_01, 1'b1, 1'b1, 6'h1e, 24'h00_da_01} ^ 30'h00_000080;
        mem[15] = {24'h00_db_00, 1'b1, 1'b1, 6'h03, 24'h00_db_00} ^ 30'h00_000100;
        mem[16] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_000200;
        mem[17] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_000400;
        mem[18] = {24'h03_20_2b, 1'b1, 1'b1, 6'h3d, 24'h03_20_2b} ^ 30'h00_000800;
        mem[19] = {24'h00_67_01, 1'b1, 1'b1, 6'h21, 24'h00_67_01} ^ 30'h00_001000;
        mem[20] = {24'h00_68_00, 1'b1, 1'b1, 6'h26, 24'h00_68_00} ^ 30'h00_002000;
        mem[21] = {24'h00_da_01, 1'b1, 1'b1, 6'h1e, 24'h00_da_01} ^ 30'h00_004000;
        mem[22] = {24'h00_db_00, 1'b1, 1'b1, 6'h03, 24'h00_db_00} ^ 30'h00_008000;
        mem[23] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_010000;
        mem[24] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_020000;
        mem[25] = {24'h03_20_2b, 1'b1, 1'b1, 6'h3d, 24'h03_20_2b} ^ 30'h00_040000;
        mem[26] = {24'h00_67_01, 1'b1, 1'b1, 6'h21, 24'h00_67_01} ^ 30'h00_080000;
        mem[27] = {24'h00_68_00, 1'b1, 1'b1, 6'h26, 24'h00_68_00} ^ 30'h00_100000;
        mem[28] = {24'h00_da_01, 1'b1, 1'b1, 6'h1e, 24'h00_da_01} ^ 30'h00_200000;
        mem[29] = {24'h00_db_00, 1'b1, 1'b1, 6'h03, 24'h00_db_00} ^ 30'h00_400000;
        mem[30] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h00_800000;
        
        mem[31] = {24'h03_20_12, 1'b1, 1'b1, 6'h32, 24'h03_20_12} ^ 30'h01_000000;
        mem[32] = {24'h03_20_2b, 1'b1, 1'b1, 6'h3d, 24'h03_20_2b} ^ 30'h02_000000;
        mem[33] = {24'h00_67_01, 1'b1, 1'b1, 6'h21, 24'h00_67_01} ^ 30'h04_000000;
        mem[34] = {24'h00_68_00, 1'b1, 1'b1, 6'h26, 24'h00_68_00} ^ 30'h08_000000;
        mem[35] = {24'h00_da_01, 1'b1, 1'b1, 6'h1e, 24'h00_da_01} ^ 30'h10_000000;
        mem[36] = {24'h00_db_00, 1'b1, 1'b1, 6'h03, 24'h00_db_00} ^ 30'h20_000000;
        
        mem[37] = {24'h03_20_12, 1'b1, 1'b0, 6'h32, 24'h03_20_12} ^ 30'h00_800001;
        mem[38] = {24'h03_20_12, 1'b1, 1'b0, 6'h32, 24'h03_20_12} ^ 30'h00_040200;
        mem[39] = {24'h03_20_2b, 1'b1, 1'b0, 6'h3d, 24'h03_20_2b} ^ 30'h00_080100;
        mem[40] = {24'h00_67_01, 1'b1, 1'b0, 6'h21, 24'h00_67_01} ^ 30'h00_400020;
        mem[41] = {24'h00_68_00, 1'b1, 1'b0, 6'h26, 24'h00_68_00} ^ 30'h00_010010;
        mem[42] = {24'h00_da_01, 1'b1, 1'b0, 6'h1e, 24'h00_da_01} ^ 30'h01_100000;
        mem[43] = {24'h00_db_00, 1'b1, 1'b0, 6'h03, 24'h00_db_00} ^ 30'h04_004000;
        mem[44] = {24'h03_20_12, 1'b1, 1'b0, 6'h32, 24'h03_20_12} ^ 30'h00_003000;
        mem[45] = {24'h03_20_12, 1'b1, 1'b0, 6'h32, 24'h03_20_12} ^ 30'h04_008000;
        mem[46] = {24'h03_20_2b, 1'b1, 1'b0, 6'h3d, 24'h03_20_2b} ^ 30'h00_003000;
        mem[47] = {24'h00_67_01, 1'b1, 1'b0, 6'h21, 24'h00_67_01} ^ 30'h00_000050;
        mem[48] = {24'h00_68_00, 1'b1, 1'b0, 6'h26, 24'h00_68_00} ^ 30'h18_000000;
        mem[49] = {24'h00_68_00, 1'b1, 1'b0, 6'h26, 24'h00_68_00} ^ 30'h00_c00000;
    end
    
    integer    index = 0;
    
    wire    [23:0]  in_exp_data;
    wire            in_exp_error;
    wire            in_exp_corrected;
    wire    [5:0]   in_ecc;
    wire    [23:0]  in_data;
    
    wire    [23:0]  out_exp_data;
    wire            out_exp_error;
    wire            out_exp_corrected;
    
    assign {in_exp_data, in_exp_error, in_exp_corrected, in_ecc, in_data} = mem[index];
    
    wire    [1+1+24-1:0]        s_user  = {in_exp_error, in_exp_corrected, in_exp_data};
    wire    [23:0]              s_data  = in_data;
    wire    [5:0]               s_ecc   = in_ecc;
    reg                         s_valid = 0;
    
    wire    [1+1+24-1:0]        m_user;
    wire    [23:0]              m_data;
    wire                        m_error;
    wire                        m_corrected;
    wire                        m_valid;
    
    assign {out_exp_error, out_exp_corrected, out_exp_data} = m_user;
    
    wire    data_ok    = (m_data      == out_exp_data);
    wire    correct_ok = (m_corrected == out_exp_corrected);
    wire    error_ok   = (m_error     == out_exp_error);
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_valid <= 1'b0;
        end
        else if ( cke ) begin
            s_valid <= 1'b1;
            
            if ( index < 49 ) begin
                if ( s_valid ) begin
                    index = index + 1;
                end
            end
            else begin
                    s_valid <= 1'b0;
            end
        end
    end
    
    
    
    jelly_mipi_ecc24
            #(
                .USER_WIDTH     (1+1+24)
            )
        i_mipi_ecc24
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_user         (s_user),
                .s_data         (s_data),
                .s_ecc          (s_ecc),
                .s_valid        (s_valid),
                
                .m_user         (m_user),
                .m_data         (m_data),
                .m_error        (m_error),
                .m_corrected    (m_corrected),
                .m_valid        (m_valid)
            );
    
    
    
    
endmodule


`default_nettype wire


// end of file
