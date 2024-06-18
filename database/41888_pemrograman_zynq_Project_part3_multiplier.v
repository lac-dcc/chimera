// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

    module multiplier (
        // *** Clock and reset ***
        input wire clk,
        input wire rst_n,
        output wire rst,
        // *** RAM input ***
        output wire [31:0] rd_addr,
        input wire [31:0] rd_data,
        // *** RAM output ***
        output wire [31:0] wr_addr,
        output wire [31:0] wr_data,
        output wire [3:0] wr_en,
        // *** Control signal ***
        input wire [9:0] num_of_inp,
        input wire [7:0] gain,
        input wire start,
        output wire done
    );
    
    localparam [1:0] S_IDLE = 4'h0,
                     S_READ = 4'h1,
                     S_WRITE = 4'h2,
                     S_DONE = 4'h3;
                                       
    reg [1:0] _cs, _ns;
    reg [31:0] rd_addr_cv, rd_addr_nv;
    reg [31:0] wr_addr_cv, wr_addr_nv;
    reg [31:0] wr_data_cv, wr_data_nv;
    reg [3:0] wr_en_cv, wr_en_nv;
    reg done_cv, done_nv;
    
    // *** Register ***
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            _cs <= S_IDLE;
            rd_addr_cv <= 0;
            wr_addr_cv <= 0;
            wr_data_cv <= 0;
            wr_en_cv <= 0;
            done_cv <= 0;
        end
        else
        begin
            _cs <= _ns;
            rd_addr_cv <= rd_addr_nv;
            wr_addr_cv <= wr_addr_nv;
            wr_data_cv <= wr_data_nv;
            wr_en_cv <= wr_en_nv;
            done_cv <= done_nv;
        end
    end
    
    // *** Next state and data path ***
    always @(*)
    begin
        _ns = _cs;
        rd_addr_nv = rd_addr_cv;
        wr_addr_nv = wr_addr_cv;
        wr_data_nv = wr_data_cv;
        wr_en_nv = wr_en_cv;
        done_nv = done_cv;
        case (_cs)
            S_IDLE:
            begin
                if (start)
                begin
                    if (num_of_inp == 0)
                    begin
                        _ns = S_DONE;
                    end
                    else
                    begin
                        done_nv = 0;
                        rd_addr_nv = 0;
                        _ns = S_READ;
                    end
                end
            end
            S_READ:
            begin
                rd_addr_nv = rd_addr_cv + 4;
                wr_data_nv = rd_data * gain;
                wr_en_nv = 4'hf;
                _ns = S_WRITE;
            end
            S_WRITE:
            begin
                wr_addr_nv = wr_addr_cv + 4;
                wr_en_nv = 4'h0;
                if (rd_addr_cv == num_of_inp)
                begin
                    _ns = S_DONE;
                end
                else
                begin
                    _ns = S_READ;
                end
            end
            S_DONE:
            begin
                rd_addr_nv = 0;
                wr_addr_nv = 0;
                done_nv = 1;
                _ns = S_IDLE;
            end
        endcase
    end
    
    // *** Output ***
    assign rst = ~rst_n;
    assign rd_addr = rd_addr_cv;
    assign wr_addr = wr_addr_cv;
    assign wr_data = wr_data_cv;
    assign wr_en = wr_en_cv;
    assign done = done_cv;
    
endmodule