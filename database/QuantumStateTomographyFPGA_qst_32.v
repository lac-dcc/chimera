// This program was cloned from: https://github.com/nemiller95/QuantumStateTomographyFPGA
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Georgia Institute of Technology
// Engineer: Nathan Eli Miller
// 
// Create Date: 06/30/2022 04:43:02 PM
// Design Name: 
// Module Name: qst_32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module qst_32(
    sys_reset, sysclk, j, done, clk_counter, ram_out //sysclk
);
    input sysclk; 
    input sys_reset;
    input [31:0] j;
    output reg done;
    output reg [31:0] clk_counter;
    output signed [31:0] ram_out;  // output wire [31 : 0] douta
    
    reg       [3:0] state = 4'd0;
    parameter read_rom         = 4'd0,
              //make_adder       = 4'd1,
              //add              = 4'd2,
              tree_adder = 4'd1,
              make_divider     = 4'd3,
              write_real       = 4'd4,
              write_imag       = 4'd5,
              inc_addrs        = 4'd6,
              print            = 4'd7;
    parameter a_width = 64,  // 2^(n+1) * (n+1)    =  8, 24,  64, 160,  384,  896
              a_size = 8,    // 2(n+1)             =  4,  6,   8,  10,   12,   14
              b_width = 32,  // constant           = 32, 32,  32,  32,   32,   32
              depth = 64,    // 4^n                =  4, 16,  64, 256, 1024, 4096
              ram_max = 128, // 2*depth = 2^(2n+1) =  8, 32, 128, 512, 2048, 8192
              n = 8'd3,      // n                  =  1,  2,   3,   4,    5,    6
              numadds = 4,    // 2^(n-1)                = 1, 2, 4, 8, 16, 32
              totaladds = 7,   // 2^n -1                 = 1, 3, 7, 15, 31, 63
              bvec_len = 256;    // 2^n * 32            = 64, 128, 256, 512, 1024, 2048
    
    // Flags and enables - may not need a lot of these adder ones
    reg rom_en = 1'b1, ram_en = 1'b1, ram_we = 1'b0; // input wire ena
    reg div_res = 1'b0;
    
    
    // Data passing and storage - ROM stores straight binary, RAM stores signed values
    reg [2*n-1:0] rom_addr = 'd0;  //  4^n = depth = 2n bits
    reg [2*n:0] ram_addr = 'd0;  // 2*(4^n) = 2*depth = 2n+1 bits
    wire [a_width-1:0] rom_out;  // 
    reg [a_width-1:0] ind;
    reg signed [31:0] mem_b [depth:0]; // 32-bit values to store b
    reg signed [31:0] ram_in;    // input wire [31 : 0] dina
    reg signed [32:0] stage0 [totaladds:0]; // mapping inputs to start vector - 2^n elements, some real some imag
    reg signed [33:0] stage1 [totaladds/2:0]; 
    reg signed [34:0] stage2 [totaladds/4:0];
    reg signed [35:0] stage3 [totaladds/8:0];
    reg signed [36:0] stage4 [totaladds/16:0]; // these go to size 1 (0:0) when too small. Probably a better way to do this
    reg signed [37:0] stage5 [totaladds/32:0];
    reg signed [38:0] stage6 [totaladds/64:0];
    reg signed [39:0] stage7 [totaladds/128:0];
    reg signed [40:0] stage8 [totaladds/256:0];
    reg signed [41:0] stage9 [totaladds/512:0];
    
    wire signed [31:0] add_out;
    reg signed [31+n:0] div_in_r, div_in_c;
    reg signed [31+n:0] rho_r, rho_c;
    reg signed [31:0] rho_r_out, rho_c_out;
    
    // Counters to delay between operations
    reg [2:0] read_rom_cnt = 3'd0;
    reg [2:0] read_ram_cnt = 3'd0;
    reg [7:0] add_delay = 8'd0;
    reg add_cnt = 1'd0;
    reg div_cnt1 = 1'd0;
    reg div_cnt2 = 1'd0;
    reg write_r_cnt1 = 1'd0;
    reg write_r_cnt2 = 1'd0;
    reg write_i_cnt = 1'd0;
    reg inc_addrs_cnt = 1'd0;
    reg add_done_flag = 1'd0;
    
    // used for reading from index encoding for adders
    integer i = 0;
    
    initial begin
        done <= 0;
        clk_counter <= 32'd0;
        $display("Loading ram.");
        $readmemb("b_lagos3_realHW_417.mem", mem_b);
    end
    
    
    brom_controller brom (
        .addr(rom_addr), // input wire [3 : 0] addra
        .clk(sysclk),    // input wire clka
        .dout(rom_out),  // output wire [23 : 0] douta
        .en(rom_en)      // input wire ena
    );
    
    bram_controller bram (
        .clk(sysclk),    // input wire clka
        .en(ram_en),     // input wire ena
        .we(ram_we),     // input wire [0 : 0] wea
        .addr(ram_addr), // input wire [12 : 0] addra
        .din(ram_in),    // input wire [31 : 0] dina
        .dout(ram_out)   // output wire [31 : 0] douta
    );
    
    genvar stage, inti;
    generate //begin: NATHAN_ADDER // call later with //NATHAN_ADDER[0].add_x.input_a <= 1;
        for (stage = 0; stage <= n; stage=stage+1) begin: stage_gen
            if (stage == 0) begin
                for (inti = 0; inti <= totaladds; inti = inti+2) begin: inputs_gen
                    localparam integer adder = inti*a_size;
                    always @(posedge sysclk) begin
                        if (ind[adder+a_size-1 -: 1] == 0 & ind[adder+a_size+a_size-1 -: 1] == 0) begin // does breaking these up cause
                                                                                               // slowdown? Better to do case 16?
                            stage0[inti][31:0] <= ((({32{ind[adder+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size-3 -: a_size-2]]) 
                                + (ind[adder+a_size-2 -: 1]&1'b1))
                                + (({32{ind[adder+a_size+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size+a_size-3 -: a_size-2]])
                                + (ind[adder+a_size+a_size-2 -: 1]&1'b1)));
                            if ((mem_b[ind[adder+a_size-3 -: a_size-2]][31]^ind[adder+a_size-2 -: 1])==(mem_b[ind[adder+a_size+a_size-3 -: a_size-2]][31]^ind[adder+a_size+a_size-2 -: 1])) begin
                                stage0[inti][32] <= (mem_b[ind[adder+a_size-3 -: a_size-2]][31]^ind[adder+a_size-2 -: 1])&(mem_b[ind[adder+a_size+a_size-3 -: a_size-2]][31]^ind[adder+a_size+a_size-2 -: 1]);
                            end else begin
                                stage0[inti][32] <= stage0[inti][31];
                            end
                            stage0[inti+1] <= {33{1'b0}};
                        end
                        else if (ind[adder+a_size-1 -: 1] == 1 & ind[adder+a_size+a_size-1 -: 1] == 1) begin
                            stage0[inti] <= {33{1'b0}};
                            stage0[inti+1][31:0] <= ((({32{ind[adder+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size-3 -: a_size-2]]) 
                                + (ind[adder+a_size-2 -: 1]&1'b1))
                                + (({32{ind[adder+a_size+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size+a_size-3 -: a_size-2]])
                                + (ind[adder+a_size+a_size-2 -: 1]&1'b1)));
                            if ((mem_b[ind[adder+a_size-3 -: a_size-2]][31]^ind[adder+a_size-2 -: 1])==(mem_b[ind[adder+a_size+a_size-3 -: a_size-2]][31]^ind[adder+a_size+a_size-2 -: 1])) begin
                                stage0[inti+1][32] <= (mem_b[ind[adder+a_size-3 -: a_size-2]][31]^ind[adder+a_size-2 -: 1])&(mem_b[ind[adder+a_size+a_size-3 -: a_size-2]][31]^ind[adder+a_size+a_size-2 -: 1]);
                            end else begin
                                stage0[inti+1][32] <= stage0[inti+1][31];
                            end
                        end
                        else if (ind[adder+a_size-1 -: 1] == 0 & ind[adder+a_size+a_size-1 -: 1] == 1) begin
                            stage0[inti][31:0] <= ({(32){ind[adder+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size-3 -: a_size-2]]) + (ind[adder+a_size-2 -: 1]&1'b1);
                            stage0[inti+1][31:0] <= ({(32){ind[adder+a_size+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size+a_size-3 -: a_size-2]]) + (ind[adder+a_size+a_size-2 -: 1]&1'b1);
                            stage0[inti][32] <= stage0[inti][31];
                            stage0[inti+1][32] <= stage0[inti+1][31];  
                        end
                        else if (ind[adder+a_size-1 -: 1] == 1 & ind[adder+a_size+a_size-1 -: 1] == 0) begin
                            stage0[inti][31:0] <= ({(32){ind[adder+a_size+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size+a_size-3 -: a_size-2]]) + (ind[adder+a_size+a_size-2 -: 1]&1'b1);
                            stage0[inti+1][31:0] <= ({(32){ind[adder+a_size-2 -: 1]}} ^ mem_b[ind[adder+a_size-3 -: a_size-2]]) + (ind[adder+a_size-2 -: 1]&1'b1);
                            stage0[inti][32] <= stage0[inti][31];
                            stage0[inti+1][32] <= stage0[inti+1][31];  
                        end
                    end
                end
            end
            else if (stage == 2) begin
                for (inti = 0; inti <= totaladds/2; inti = inti+2) begin: stage1gen    
                    always @(posedge sysclk) begin
                        stage1[inti] <= stage0[2*inti]+stage0[2*(inti+1)];
                        stage1[inti+1] <= stage0[2*inti+1]+stage0[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 3) begin
                for (inti = 0; inti <= totaladds/4; inti = inti+2) begin: stage2gen    
                    always @(posedge sysclk) begin
                        stage2[inti] <= stage1[2*inti]+stage1[2*(inti+1)];
                        stage2[inti+1] <= stage1[2*inti+1]+stage1[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 4) begin
                for (inti = 0; inti <= totaladds/8; inti = inti+2) begin: stage3gen    
                    always @(posedge sysclk) begin
                        stage3[inti] <= stage2[2*inti]+stage2[2*(inti+1)];
                        stage3[inti+1] <= stage2[2*inti+1]+stage2[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 5) begin
                for (inti = 0; inti <= totaladds/16; inti = inti+2) begin: stage4gen    
                    always @(posedge sysclk) begin
                        stage4[inti] <= stage3[2*inti]+stage3[2*(inti+1)];
                        stage4[inti+1] <= stage3[2*inti+1]+stage3[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 6) begin
                for (inti = 0; inti <= totaladds/32; inti = inti+2) begin: stage5gen    
                    always @(posedge sysclk) begin
                        stage5[inti] <= stage4[2*inti]+stage4[2*(inti+1)];
                        stage5[inti+1] <= stage4[2*inti+1]+stage4[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 7) begin
                for (inti = 0; inti <= totaladds/64; inti = inti+2) begin: stage6gen    
                    always @(posedge sysclk) begin
                        stage6[inti] <= stage5[2*inti]+stage5[2*(inti+1)];
                        stage6[inti+1] <= stage5[2*inti+1]+stage5[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 8) begin
                for (inti = 0; inti <= totaladds/128; inti = inti+2) begin: stage7gen    
                    always @(posedge sysclk) begin
                        stage7[inti] <= stage6[2*inti]+stage6[2*(inti+1)];
                        stage7[inti+1] <= stage6[2*inti+1]+stage6[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 9) begin
                for (inti = 0; inti <= totaladds/256; inti = inti+2) begin: stage8gen    
                    always @(posedge sysclk) begin
                        stage8[inti] <= stage7[2*inti]+stage7[2*(inti+1)];
                        stage8[inti+1] <= stage7[2*inti+1]+stage7[2*(inti+1)+1];
                    end
                end
            end
            else if (stage == 10) begin
                for (inti = 0; inti <= totaladds/512; inti = inti+2) begin: stage9gen    
                    always @(posedge sysclk) begin
                        stage9[inti] <= stage8[2*inti]+stage8[2*(inti+1)];
                        stage9[inti+1] <= stage8[2*inti+1]+stage8[2*(inti+1)+1];
                    end
                end
            end
        end
    endgenerate

    
    always @(posedge sysclk)
    begin
        if (done == 1'b0) begin
            clk_counter <= clk_counter + 1;
        end
        case (state)
            read_rom:
                begin
                    rom_en <= 1'b1;
                    if(read_rom_cnt>=3'd3) begin
                        ind <= rom_out;
                        state <= tree_adder;
                        read_rom_cnt <= 3'd0;
                        rom_en <= 1'b0;
                    end else begin
                        read_rom_cnt <= read_rom_cnt + 3'd1;
                        state <= state;
                    end                    
                end
            tree_adder:
                begin
                // 2^n -1 adders in n layers - delay appears unneeded
                    if (add_delay > n) begin
                        case(n)
                            1:
                                fork
                                    rho_r <= stage0[0];
                                    rho_c <= stage0[1];
                                join
                            2: 
                                fork
                                    rho_r <= stage1[0];
                                    rho_c <= stage1[1];
                                join
                            3: 
                                fork
                                    rho_r <= stage2[0];
                                    rho_c <= stage2[1];
                                join
                            4: 
                                fork
                                    rho_r <= stage3[0];
                                    rho_c <= stage3[1];
                                join
                            5: 
                                fork
                                    rho_r <= stage4[0];
                                    rho_c <= stage4[1];
                                join
                            6: 
                                fork
                                    rho_r <= stage5[0];
                                    rho_c <= stage5[1];
                                join
                        endcase
                        add_delay <= 8'd0;
                        state <= make_divider;
                    end else begin
                        add_delay <= add_delay + 8'd1;
                        state <= tree_adder;
                    end
                    // delay here?
                end
            make_divider:
                begin
                    div_in_r <= rho_r;
                    div_in_c <= rho_c;
                    div_cnt1 <= 1;
                    if (div_cnt1 == 1) begin
                        fork
                            rho_r_out <= div_in_r >> n;
                            rho_c_out <= div_in_c >> n;
                        join
                        div_cnt1 <= 0;
                        state <= write_real;
                    end
                end
            write_real:
                begin
                    if (write_r_cnt1 == 0) begin
                        ram_in <= rho_r_out;
                        write_r_cnt1 <= 1;
                        state <= write_real;
                    end else begin
                        ram_we <= 1'b1;
                        if (write_r_cnt2 == 0) begin
                            write_r_cnt2 <= 1;
                            state <= write_real;
                        end else begin
                            write_r_cnt1 <= 0;
                            write_r_cnt2 <= 0;
                            state <= write_imag;
                        end
                    end   
                end
            write_imag:
                begin
                    if (write_i_cnt == 0) begin
                        ram_addr <= ram_addr + 1;
                        ram_in <= rho_c_out;
                        write_i_cnt <= 1;
                        state <= write_imag;
                    end else begin
                        ram_we <= 1'b0;
                        state <= inc_addrs;
                        write_i_cnt <= 0;
                    end
                end
            inc_addrs:
                begin
                    if (rom_addr == depth-1) begin //overflows back to 0
                        ram_addr <= 0;
                        rom_addr <= 0;
                        state <= print;
                    end else begin
                        ram_addr <= ram_addr + 1;
                        rom_addr <= rom_addr + 1;
                        state <= read_rom;
                    end
                end
            print:
                begin
                    done <= 1'b1;
                    ram_addr <= j;
                end
        endcase  
        if (sys_reset == 1'b1) begin
            //sys_reset <= 1'b0;
            done <= 1'b0;
            ram_addr <= 0;
            rom_addr <= 0;
            clk_counter <= 0;
            // used to wait here
            read_rom_cnt <= 0;
            state <= read_rom;
        end  
    end
endmodule
