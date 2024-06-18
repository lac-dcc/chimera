// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps
// ©2024 歐陽文孝
module nn
    (
        input wire         clk,
        input wire         rst_n,
        input wire         en,
        input wire         clr,
        // *** Control and status port ***
        output wire        ready,
        input wire         start,
        output wire        done,
        // *** Weight port ***
        input wire         wb_ena,
        input wire [2:0]   wb_addra,
        input wire [63:0]  wb_dina,
        input wire [7:0]   wb_wea,
        // *** Data input port ***
        input wire         k_ena,
        input wire [1:0]   k_addra,
        input wire [63:0]  k_dina,
        input wire [7:0]   k_wea,
        // *** Data output port ***
        input wire         a_enb,
        input wire [1:0]   a_addrb,
        output wire [63:0] a_doutb
    );
    
    // Weight BRAM
    wire wb_enb;
    wire [2:0] wb_addrb;
    wire [63:0] wb_doutb;

    wire [15:0] wb_doutb_0;
    wire [15:0] wb_doutb_1;
    wire [15:0] wb_doutb_2;
    wire [15:0] wb_doutb_3;
        
    // Input BRAM
    wire k_enb;
    wire [1:0] k_addrb;
    wire [63:0] k_doutb;
    
    wire [15:0] k_doutb_0;
    wire [15:0] k_doutb_1;
    wire [15:0] k_doutb_2;
    wire [15:0] k_doutb_3;
    
    // Counter for main controller 
    reg [5:0] cnt_main_reg;
    
    // Multiplexer and register for systolic moving input
    wire [0:0] a0_sel, a1_sel, a2_sel, a3_sel;
    wire [15:0] a0, a1, a2, a3;
    
    // Multiplexer and register for systolic stationary input
    wire [1:0] b00_sel, b01_sel, b02_sel, b03_sel;
    wire [1:0] b10_sel, b11_sel, b12_sel, b13_sel;
    wire [1:0] b20_sel, b21_sel, b22_sel, b23_sel;
    wire [1:0] b30_sel, b31_sel, b32_sel, b33_sel;
    
    wire [15:0] b00_next, b01_next, b02_next, b03_next;
    wire [15:0] b10_next, b11_next, b12_next, b13_next;
    wire [15:0] b20_next, b21_next, b22_next, b23_next;
    wire [15:0] b30_next, b31_next, b32_next, b33_next;
    
    wire [15:0] b00_reg, b01_reg, b02_reg, b03_reg;
    wire [15:0] b10_reg, b11_reg, b12_reg, b13_reg;
    wire [15:0] b20_reg, b21_reg, b22_reg, b23_reg;
    wire [15:0] b30_reg, b31_reg, b32_reg, b33_reg;
    
    // Systolic
    wire sys_in_valid;
    wire [15:0] y0, y1, y2, y3;
    wire sys_out_valid;
    
    // Sigmoid
    wire [15:0] s0, s1, s2, s3;
    wire sig_out_valid;
    
    wire [15:0] s0_reg0, s0_reg1;
    wire [15:0] s1_reg0, s1_reg1;
    wire [15:0] s2_reg0, s2_reg1;
    wire [15:0] s3_reg0, s3_reg1;
    
    wire sig_out_valid_reg0, sig_out_valid_reg1;
 
    // Output BRAM
    wire a_ena;
    wire [7:0] a_wea;
    wire [1:0] a_addra;
    wire [63:0] a_dina;
    
    // *** Weight BRAM **********************************************************
    // xpm_memory_tdpram: True Dual Port RAM
    // Xilinx Parameterized Macro, version 2018.3
    xpm_memory_tdpram
    #(
        // Common module parameters
        .MEMORY_SIZE(512),                   // DECIMAL, size: 8x64bit= 512 bits
        .MEMORY_PRIMITIVE("auto"),           // String
        .CLOCKING_MODE("common_clock"),      // String, "common_clock"
        .MEMORY_INIT_FILE("none"),           // String
        .MEMORY_INIT_PARAM("0"),             // String      
        .USE_MEM_INIT(1),                    // DECIMAL
        .WAKEUP_TIME("disable_sleep"),       // String
        .MESSAGE_CONTROL(0),                 // DECIMAL
        .AUTO_SLEEP_TIME(0),                 // DECIMAL          
        .ECC_MODE("no_ecc"),                 // String
        .MEMORY_OPTIMIZATION("true"),        // String              
        .USE_EMBEDDED_CONSTRAINT(0),         // DECIMAL
        
        // Port A module parameters
        .WRITE_DATA_WIDTH_A(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_A(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_A(8),              // DECIMAL
        .ADDR_WIDTH_A(3),                    // DECIMAL, clog2(512/64)=clog2(8)= 3
        .READ_RESET_VALUE_A("0"),            // String
        .READ_LATENCY_A(1),                  // DECIMAL
        .WRITE_MODE_A("write_first"),        // String
        .RST_MODE_A("SYNC"),                 // String
        
        // Port B module parameters  
        .WRITE_DATA_WIDTH_B(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_B(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_B(8),              // DECIMAL
        .ADDR_WIDTH_B(3),                    // DECIMAL, clog2(512/64)=clog2(8)= 3
        .READ_RESET_VALUE_B("0"),            // String
        .READ_LATENCY_B(1),                  // DECIMAL
        .WRITE_MODE_B("write_first"),        // String
        .RST_MODE_B("SYNC")                  // String
    )
    xpm_memory_tdpram_wb
    (
        .sleep(1'b0),
        .regcea(1'b1), //do not change
        .injectsbiterra(1'b0), //do not change
        .injectdbiterra(1'b0), //do not change   
        .sbiterra(), //do not change
        .dbiterra(), //do not change
        .regceb(1'b1), //do not change
        .injectsbiterrb(1'b0), //do not change
        .injectdbiterrb(1'b0), //do not change              
        .sbiterrb(), //do not change
        .dbiterrb(), //do not change
        
        // Port A module ports
        .clka(clk),
        .rsta(~rst_n),
        .ena(wb_ena),
        .wea(wb_wea),
        .addra(wb_addra),
        .dina(wb_dina),
        .douta(),
        
        // Port B module ports
        .clkb(clk),
        .rstb(~rst_n),
        .enb(wb_enb),
        .web(0),
        .addrb(wb_addrb),
        .dinb(0),
        .doutb(wb_doutb)
    );
    assign wb_doutb_0 = wb_doutb[15:0];
    assign wb_doutb_1 = wb_doutb[31:16];
    assign wb_doutb_2 = wb_doutb[47:32];
    assign wb_doutb_3 = wb_doutb[63:48];
        
    // *** Input BRAM ***********************************************************  
    // xpm_memory_tdpram: True Dual Port RAM
    // Xilinx Parameterized Macro, version 2018.3
    xpm_memory_tdpram
    #(
        // Common module parameters
        .MEMORY_SIZE(256),                   // DECIMAL, size: 4x64bit= 256 bits
        .MEMORY_PRIMITIVE("auto"),           // String
        .CLOCKING_MODE("common_clock"),      // String, "common_clock"
        .MEMORY_INIT_FILE("none"),           // String
        .MEMORY_INIT_PARAM("0"),             // String      
        .USE_MEM_INIT(1),                    // DECIMAL
        .WAKEUP_TIME("disable_sleep"),       // String
        .MESSAGE_CONTROL(0),                 // DECIMAL
        .AUTO_SLEEP_TIME(0),                 // DECIMAL          
        .ECC_MODE("no_ecc"),                 // String
        .MEMORY_OPTIMIZATION("true"),        // String              
        .USE_EMBEDDED_CONSTRAINT(0),         // DECIMAL
        
        // Port A module parameters
        .WRITE_DATA_WIDTH_A(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_A(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_A(8),              // DECIMAL
        .ADDR_WIDTH_A(2),                    // DECIMAL, clog2(256/64)=clog2(4)= 2
        .READ_RESET_VALUE_A("0"),            // String
        .READ_LATENCY_A(1),                  // DECIMAL
        .WRITE_MODE_A("write_first"),        // String
        .RST_MODE_A("SYNC"),                 // String
        
        // Port B module parameters  
        .WRITE_DATA_WIDTH_B(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_B(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_B(8),              // DECIMAL
        .ADDR_WIDTH_B(2),                    // DECIMAL, clog2(256/64)=clog2(8)= 2
        .READ_RESET_VALUE_B("0"),            // String
        .READ_LATENCY_B(1),                  // DECIMAL
        .WRITE_MODE_B("write_first"),        // String
        .RST_MODE_B("SYNC")                  // String
    )
    xpm_memory_tdpram_k
    (
        .sleep(1'b0),
        .regcea(1'b1), //do not change
        .injectsbiterra(1'b0), //do not change
        .injectdbiterra(1'b0), //do not change   
        .sbiterra(), //do not change
        .dbiterra(), //do not change
        .regceb(1'b1), //do not change
        .injectsbiterrb(1'b0), //do not change
        .injectdbiterrb(1'b0), //do not change              
        .sbiterrb(), //do not change
        .dbiterrb(), //do not change
        
        // Port A module ports
        .clka(clk),
        .rsta(~rst_n),
        .ena(k_ena),
        .wea(k_wea),
        .addra(k_addra),
        .dina(k_dina),
        .douta(),
        
        // Port B module ports
        .clkb(clk),
        .rstb(~rst_n),
        .enb(k_enb),
        .web(0),
        .addrb(k_addrb),
        .dinb(0),
        .doutb(k_doutb)
    );
    assign k_doutb_0 = k_doutb[15:0];
    assign k_doutb_1 = k_doutb[31:16];
    assign k_doutb_2 = k_doutb[47:32];
    assign k_doutb_3 = k_doutb[63:48];
    
    // *** Counter for main controller ******************************************
    always @(posedge clk)
    begin
        if (!rst_n || clr)
        begin
            cnt_main_reg <= 0;
        end
        else if (start)
        begin
            cnt_main_reg <= cnt_main_reg + 1;
        end
        else if (cnt_main_reg >= 1 && cnt_main_reg <= 32)
        begin
            cnt_main_reg <= cnt_main_reg + 1;
        end
        else if (cnt_main_reg >= 33)
        begin
            cnt_main_reg <= 0;
        end
    end
    
    // Weight BRAM control
    assign wb_enb = ((cnt_main_reg >= 3) && (cnt_main_reg <= 5)) ? 1 :
                    ((cnt_main_reg >= 18) && (cnt_main_reg <= 19)) ? 1 : 0;
    assign wb_addrb = (cnt_main_reg == 3) ? 0 :
                      (cnt_main_reg == 4) ? 1 :
                      (cnt_main_reg == 5) ? 2 :
                      (cnt_main_reg == 18) ? 3 :
                      (cnt_main_reg == 19) ? 4 : 0;
    
    // Systolic moving input multiplexer control 
    assign a0_sel = ((cnt_main_reg >= 4) && (cnt_main_reg <= 6)) ? 0 :
                    ((cnt_main_reg >= 19) && (cnt_main_reg <= 20)) ? 0 : 1;
    assign a1_sel = ((cnt_main_reg >= 4) && (cnt_main_reg <= 6)) ? 0 :
                    ((cnt_main_reg >= 19) && (cnt_main_reg <= 20)) ? 0 : 1;
    assign a2_sel = ((cnt_main_reg >= 4) && (cnt_main_reg <= 6)) ? 0 :
                    ((cnt_main_reg >= 19) && (cnt_main_reg <= 20)) ? 0 : 1;
    assign a3_sel = ((cnt_main_reg >= 4) && (cnt_main_reg <= 6)) ? 0 :
                    ((cnt_main_reg >= 19) && (cnt_main_reg <= 20)) ? 0 : 1;
                    
    // Input BRAM control
    assign k_enb = ((cnt_main_reg >= 1) && (cnt_main_reg <= 2)) ? 1 : 0;
    assign k_addrb = (cnt_main_reg == 1) ? 0 :
                     (cnt_main_reg == 2) ? 1 : 0;
    
    // Systolic stationary input multiplexer control                 
    assign b00_sel = (cnt_main_reg == 2) ? 0 :
                     (cnt_main_reg == 16) ? 1 : 3;
    assign b01_sel = (cnt_main_reg == 2) ? 0 :
                     (cnt_main_reg == 16) ? 1 : 3;
    assign b02_sel = (cnt_main_reg == 2) ? 0 :
                     (cnt_main_reg == 16) ? 1 : 3;
    assign b03_sel = (cnt_main_reg == 2) ? 0 :
                     (cnt_main_reg == 16) ? 1 : 3;
    
    assign b10_sel = (cnt_main_reg == 3) ? 0 :
                     (cnt_main_reg == 17) ? 1 : 3;
    assign b11_sel = (cnt_main_reg == 3) ? 0 :
                     (cnt_main_reg == 17) ? 1 : 3;
    assign b12_sel = (cnt_main_reg == 3) ? 0 :
                     (cnt_main_reg == 17) ? 1 : 3;
    assign b13_sel = (cnt_main_reg == 3) ? 0 :
                     (cnt_main_reg == 17) ? 1 : 3;
    
    assign b20_sel = (cnt_main_reg == 2) ? 2 :
                     (cnt_main_reg == 18) ? 1 : 3;
    assign b21_sel = (cnt_main_reg == 2) ? 2 :
                     (cnt_main_reg == 18) ? 1 : 3;
    assign b22_sel = (cnt_main_reg == 2) ? 2 :
                     (cnt_main_reg == 18) ? 1 : 3;
    assign b23_sel = (cnt_main_reg == 2) ? 2 :
                     (cnt_main_reg == 18) ? 1 : 3;
    
    assign b30_sel = (cnt_main_reg == 16) ? 2 : 3;
    assign b31_sel = (cnt_main_reg == 16) ? 2 : 3;
    assign b32_sel = (cnt_main_reg == 16) ? 2 : 3;
    assign b33_sel = (cnt_main_reg == 16) ? 2 : 3;
    
    // Systolic control
    assign sys_in_valid = ((cnt_main_reg >= 4) && (cnt_main_reg <= 7)) ? 1 :
                          ((cnt_main_reg >= 19) && (cnt_main_reg <= 22)) ? 1 : 0;

    // Output BRAM control
    assign a_ena = ((cnt_main_reg >= 29) && (cnt_main_reg <= 30)) ? 1 : 0;
    assign a_wea = ((cnt_main_reg >= 29) && (cnt_main_reg <= 30)) ? 8'hff : 0;
    assign a_addra = (cnt_main_reg == 29) ? 0 :
                     (cnt_main_reg == 30) ? 1 : 0; 
    
    // Status control
    assign ready = (cnt_main_reg == 0) ? 1 : 0;
    assign done = (cnt_main_reg == 33) ? 1 : 0;
    
    // *** Multiplexer for systolic moving input *******************
    assign a0 = (a0_sel == 0) ? wb_doutb_0 : 0;
    assign a1 = (a1_sel == 0) ? wb_doutb_1 : 0;
    assign a2 = (a2_sel == 0) ? wb_doutb_2 : 0;
    assign a3 = (a3_sel == 0) ? wb_doutb_3 : 0;
    
    // *** Multiplexer and register for systolic stationary input ***************
    assign b00_next = (b00_sel == 0) ? k_doutb_0 :
                      (b00_sel == 1) ? s0_reg1 :
                      (b00_sel == 2) ? 16'b0000010000000000 : b00_reg;
    assign b01_next = (b01_sel == 0) ? k_doutb_1 :
                      (b01_sel == 1) ? s1_reg1 :
                      (b01_sel == 2) ? 16'b0000010000000000 : b01_reg;
    assign b02_next = (b02_sel == 0) ? k_doutb_2 :
                      (b02_sel == 1) ? s2_reg1 :
                      (b02_sel == 2) ? 16'b0000010000000000 : b02_reg;
    assign b03_next = (b03_sel == 0) ? k_doutb_3 :
                      (b03_sel == 1) ? s3_reg1 :
                      (b03_sel == 2) ? 16'b0000010000000000 : b03_reg;

    register #(16) reg_b00(clk, rst_n, en, clr, b00_next, b00_reg); 
    register #(16) reg_b01(clk, rst_n, en, clr, b01_next, b01_reg); 
    register #(16) reg_b02(clk, rst_n, en, clr, b02_next, b02_reg); 
    register #(16) reg_b03(clk, rst_n, en, clr, b03_next, b03_reg);
                      
    assign b10_next = (b10_sel == 0) ? k_doutb_0 :
                      (b10_sel == 1) ? s0_reg1 :
                      (b10_sel == 2) ? 16'b0000010000000000 : b10_reg;
    assign b11_next = (b11_sel == 0) ? k_doutb_1 :
                      (b11_sel == 1) ? s1_reg1 :
                      (b11_sel == 2) ? 16'b0000010000000000 : b11_reg;
    assign b12_next = (b12_sel == 0) ? k_doutb_2 :
                      (b12_sel == 1) ? s2_reg1 :
                      (b12_sel == 2) ? 16'b0000010000000000 : b12_reg;
    assign b13_next = (b13_sel == 0) ? k_doutb_3 :
                      (b13_sel == 1) ? s3_reg1 :
                      (b13_sel == 2) ? 16'b0000010000000000 : b13_reg;
                      
    register #(16) reg_b10(clk, rst_n, en, clr, b10_next, b10_reg); 
    register #(16) reg_b11(clk, rst_n, en, clr, b11_next, b11_reg); 
    register #(16) reg_b12(clk, rst_n, en, clr, b12_next, b12_reg); 
    register #(16) reg_b13(clk, rst_n, en, clr, b13_next, b13_reg); 
                      
    assign b20_next = (b20_sel == 0) ? k_doutb_0 :
                      (b20_sel == 1) ? s0_reg1 :
                      (b20_sel == 2) ? 16'b0000010000000000 : b20_reg;
    assign b21_next = (b21_sel == 0) ? k_doutb_1 :
                      (b21_sel == 1) ? s1_reg1 :
                      (b21_sel == 2) ? 16'b0000010000000000 : b21_reg;
    assign b22_next = (b22_sel == 0) ? k_doutb_2 :
                      (b22_sel == 1) ? s2_reg1 :
                      (b22_sel == 2) ? 16'b0000010000000000 : b22_reg;
    assign b23_next = (b23_sel == 0) ? k_doutb_3 :
                      (b23_sel == 1) ? s3_reg1 :
                      (b23_sel == 2) ? 16'b0000010000000000 : b23_reg;
                      
    register #(16) reg_b20(clk, rst_n, en, clr, b20_next, b20_reg); 
    register #(16) reg_b21(clk, rst_n, en, clr, b21_next, b21_reg); 
    register #(16) reg_b22(clk, rst_n, en, clr, b22_next, b22_reg); 
    register #(16) reg_b23(clk, rst_n, en, clr, b23_next, b23_reg); 
                      
    assign b30_next = (b30_sel == 0) ? k_doutb_0 :
                      (b30_sel == 1) ? s0_reg1 :
                      (b30_sel == 2) ? 16'b0000010000000000 : b30_reg;
    assign b31_next = (b31_sel == 0) ? k_doutb_1 :
                      (b31_sel == 1) ? s1_reg1 :
                      (b31_sel == 2) ? 16'b0000010000000000 : b31_reg;
    assign b32_next = (b32_sel == 0) ? k_doutb_2 :
                      (b32_sel == 1) ? s2_reg1 :
                      (b32_sel == 2) ? 16'b0000010000000000 : b32_reg;
    assign b33_next = (b33_sel == 0) ? k_doutb_3 :
                      (b33_sel == 1) ? s3_reg1 :
                      (b33_sel == 2) ? 16'b0000010000000000 : b33_reg;
                      
    register #(16) reg_b30(clk, rst_n, en, clr, b30_next, b30_reg); 
    register #(16) reg_b31(clk, rst_n, en, clr, b31_next, b31_reg); 
    register #(16) reg_b32(clk, rst_n, en, clr, b32_next, b32_reg); 
    register #(16) reg_b33(clk, rst_n, en, clr, b33_next, b33_reg); 
    
    // *** Systolic *************************************************************
    systolic
    #(
        .WIDTH(16),
        .FRAC_BIT(10)
    )
    dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .a0(a0), .a1(a1), .a2(a2), .a3(a3),
        .in_valid(sys_in_valid),
        .b00(b00_reg), .b01(b01_reg), .b02(b02_reg), .b03(b03_reg),
        .b10(b10_reg), .b11(b11_reg), .b12(b12_reg), .b13(b13_reg),
        .b20(b20_reg), .b21(b21_reg), .b22(b22_reg), .b23(b23_reg),
        .b30(b30_reg), .b31(b31_reg), .b32(b32_reg), .b33(b33_reg),
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .out_valid(sys_out_valid)
    );
    
    // *** Sigmoid **************************************************************
    sigmoid sigmoid_0(clk, rst_n, en, clr, y0, s0);
    sigmoid sigmoid_1(clk, rst_n, en, clr, y1, s1);
    sigmoid sigmoid_2(clk, rst_n, en, clr, y2, s2);
    sigmoid sigmoid_3(clk, rst_n, en, clr, y3, s3);
    
    register #(16) reg_sig_00(clk, rst_n, en, clr, s0,      s0_reg0);
    register #(16) reg_sig_01(clk, rst_n, en, clr, s0_reg0, s0_reg1);
    register #(16) reg_sig_10(clk, rst_n, en, clr, s1,      s1_reg0);
    register #(16) reg_sig_11(clk, rst_n, en, clr, s1_reg0, s1_reg1);
    register #(16) reg_sig_20(clk, rst_n, en, clr, s2,      s2_reg0);
    register #(16) reg_sig_21(clk, rst_n, en, clr, s2_reg0, s2_reg1);
    register #(16) reg_sig_30(clk, rst_n, en, clr, s3,      s3_reg0);
    register #(16) reg_sig_31(clk, rst_n, en, clr, s3_reg0, s3_reg1);
     
    register #(1) reg_sig_valid_0(clk, rst_n, en, clr, sys_out_valid,      sig_out_valid); 
    register #(1) reg_sig_valid_1(clk, rst_n, en, clr, sig_out_valid,      sig_out_valid_reg0); 
    register #(1) reg_sig_valid_2(clk, rst_n, en, clr, sig_out_valid_reg0, sig_out_valid_reg1); 

    // *** Output BRAM **********************************************************
    assign a_dina = {s3, s2, s1, s0};
    // xpm_memory_tdpram: True Dual Port RAM
    // Xilinx Parameterized Macro, version 2018.3
    xpm_memory_tdpram
    #(
        // Common module parameters
        .MEMORY_SIZE(256),                   // DECIMAL, size: 4x64bit= 256 bits
        .MEMORY_PRIMITIVE("auto"),           // String
        .CLOCKING_MODE("common_clock"),      // String, "common_clock"
        .MEMORY_INIT_FILE("none"),           // String
        .MEMORY_INIT_PARAM("0"),             // String      
        .USE_MEM_INIT(1),                    // DECIMAL
        .WAKEUP_TIME("disable_sleep"),       // String
        .MESSAGE_CONTROL(0),                 // DECIMAL
        .AUTO_SLEEP_TIME(0),                 // DECIMAL          
        .ECC_MODE("no_ecc"),                 // String
        .MEMORY_OPTIMIZATION("true"),        // String              
        .USE_EMBEDDED_CONSTRAINT(0),         // DECIMAL
        
        // Port A module parameters
        .WRITE_DATA_WIDTH_A(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_A(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_A(8),              // DECIMAL
        .ADDR_WIDTH_A(2),                    // DECIMAL, clog2(256/64)=clog2(4)= 2
        .READ_RESET_VALUE_A("0"),            // String
        .READ_LATENCY_A(1),                  // DECIMAL
        .WRITE_MODE_A("write_first"),        // String
        .RST_MODE_A("SYNC"),                 // String
        
        // Port B module parameters  
        .WRITE_DATA_WIDTH_B(64),             // DECIMAL, data width: 64-bit
        .READ_DATA_WIDTH_B(64),              // DECIMAL, data width: 64-bit
        .BYTE_WRITE_WIDTH_B(8),              // DECIMAL
        .ADDR_WIDTH_B(2),                    // DECIMAL, clog2(256/64)=clog2(8)= 2
        .READ_RESET_VALUE_B("0"),            // String
        .READ_LATENCY_B(1),                  // DECIMAL
        .WRITE_MODE_B("write_first"),        // String
        .RST_MODE_B("SYNC")                  // String
    )
    xpm_memory_tdpram_a
    (
        .sleep(1'b0),
        .regcea(1'b1), //do not change
        .injectsbiterra(1'b0), //do not change
        .injectdbiterra(1'b0), //do not change   
        .sbiterra(), //do not change
        .dbiterra(), //do not change
        .regceb(1'b1), //do not change
        .injectsbiterrb(1'b0), //do not change
        .injectdbiterrb(1'b0), //do not change              
        .sbiterrb(), //do not change
        .dbiterrb(), //do not change
        
        // Port A module ports
        .clka(clk),
        .rsta(~rst_n),
        .ena(a_ena),
        .wea(a_wea),
        .addra(a_addra),
        .dina(a_dina),
        .douta(),
        
        // Port B module ports
        .clkb(clk),
        .rstb(~rst_n),
        .enb(a_enb),
        .web(0),
        .addrb(a_addrb),
        .dinb(0),
        .doutb(a_doutb)
    );
    
endmodule
