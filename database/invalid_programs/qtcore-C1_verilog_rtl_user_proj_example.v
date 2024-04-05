// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output reg wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [15:0] io_in,
    output [15:0] io_out,
    output [15:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [15:0] io_in;
    wire [15:0] io_out;
    wire [15:0] io_oeb;

    wire [7:0] wbs_adr_int;

    wire [15:0] rdata; 
    wire [15:0] wdata;
    wire [15:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;

    wire [7:0] p0_io_out;

    assign valid = wbs_cyc_i && wbs_stb_i;

    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    //assign wbs_dat_o = rdata;
    //assign wdata = wbs_dat_i[15:0];

    assign io_oeb = {8'hff, 8'h00}; //top 8 bits are inputs, bottom 8 bits are outputs

    reg[7:0] io_in_reg_pipe;
    reg[7:0] io_in_reg;
    always @(posedge clk) begin
        io_in_reg_pipe <= io_in[15:8];
        io_in_reg <= io_in_reg_pipe;
    end

    // IO
    assign io_out[7:0] = p0_io_out;

    // IRQ
    assign irq[2:1] = 2'b00;	// Unused

    


    wire p0_halt_out;
    reg [31:0] p0_scan_io;
    reg [31:0] p0_scan_wbs;

    wire p0_irq_out;

    wire [7:0] p0_sig_in;
    wire [5:0] p0_sig_out;
    reg [7:0] p0_sig_in_reg;
    assign p0_sig_in = p0_sig_in_reg;

    reg p0_scan_go;
    reg p0_scan_enable;
    reg [4:0] p0_scan_cnt;
    reg p0_scan_in_progress;
    reg p0_scan_done_strobe;

    wire p0_scan_in = p0_scan_io[31];
    wire p0_scan_out;

    reg p0_proc_go;

    wire p0_scan_in_final, p0_scan_enable_final, p0_proc_en_final;


    // // Assuming LA probes [63:32] are for controlling the count register  
    // assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign p0_scan_in_final = (~la_oenb[66]) ? la_data_in[66]: p0_scan_in;
    assign p0_scan_enable_final = (~la_oenb[67]) ? la_data_in[67]: p0_scan_enable;
    assign p0_proc_en_final = (~la_oenb[68]) ? la_data_in[68]: p0_proc_go;

    // LA    
    assign la_data_out = {23'b0,                //23
                          p0_proc_en_final,     //1
                          p0_halt_out,          //1
                          p0_irq_out,           //1
                          p0_scan_enable_final, //1 
                          p0_scan_enable,       //1
                          p0_scan_in_final,     //1 
                          p0_scan_in,           //1
                          p0_scan_out,          //1
                          p0_proc_go,           //1
                          p0_scan_done_strobe,  //1
                          p0_scan_in_progress,  //1
                          p0_scan_go,           //1
                          p0_scan_cnt,          //5
                          p0_sig_in_reg,        //8
                          p0_io_out,            //8
                          io_in_reg,            //8
                          p0_scan_wbs,          //32
                          p0_scan_io};          //32

    //initial $display("Hello world!");

    always@(posedge clk) begin
        wbs_ack_o <= 0;

        if(rst) begin
            p0_scan_wbs <= 0;
            p0_proc_go <= 0;
            p0_scan_go <= 0;
            p0_sig_in_reg <= 0;
        end else begin
            if(p0_scan_done_strobe) begin
                p0_scan_go <= 0;
                p0_scan_wbs <= p0_scan_io;
                $display("p0_scan_io unloading, = %b", p0_scan_io);
            end
            if(valid) begin
                wbs_ack_o <= 1;
                if(wbs_adr_i[7:0] == 8'h00) begin

                    
                    if(wstrb[0])
                        //$display("setting p0_scan_wbs[7:0] to %h", wbs_dat_i[7:0]);
                        p0_scan_wbs[7:0] <= wbs_dat_i[7:0];
                    if(wstrb[1])
                        //$display("setting p0_scan_wbs[15:8] to %h", wbs_dat_i[15:8]);
                        p0_scan_wbs[15:8] <= wbs_dat_i[15:8];
                    if(wstrb[2])
                        //$display("setting p0_scan_wbs[23:16] to %h", wbs_dat_i[23:16]);
                        p0_scan_wbs[23:16] <= wbs_dat_i[23:16];
                    if(wstrb[3])
                        //$display("setting p0_scan_wbs[31:24] to %h", wbs_dat_i[31:24]);
                        p0_scan_wbs[31:24] <= wbs_dat_i[31:24];

                end else if(wbs_adr_i[7:0] == 8'h04) begin
                    if(wstrb[0]) begin
                        if(wbs_dat_i[0] == 1'b1)
                            p0_scan_go <= 1;
                        
                        p0_proc_go <= wbs_dat_i[1];
                    end
                end else if(wbs_adr_i[7:0] == 8'h08) begin
                    if(wstrb[0]) begin
                        p0_sig_in_reg <= wbs_dat_i[7:0];
                    end
                end
            end
        end
    end

    reg p0_scan_first_cycle = 0;

    always@(posedge clk) begin
        p0_scan_done_strobe <= 0;
        p0_scan_enable <= 0;
        if(rst) begin
            p0_scan_in_progress <= 0;
            p0_scan_first_cycle <= 0;
            p0_scan_cnt <= 0;
            p0_scan_io <= 0;
        end else begin
            if(p0_scan_go==1 && 
                p0_scan_in_progress == 0 &&
                p0_proc_go == 0 &&
                p0_scan_first_cycle == 0 && 
                p0_scan_done_strobe==0) begin
                
                //$display("p0_scan_io loading, = %h", p0_scan_wbs);
                p0_scan_io <= p0_scan_wbs;
                p0_scan_cnt <= 5'd31;
                p0_scan_first_cycle <= 1;
            end else if(p0_scan_first_cycle == 1) begin
                p0_scan_in_progress <= 1;
                p0_scan_first_cycle <= 0;
                p0_scan_enable <= 1;
            end else if(p0_scan_in_progress == 1) begin
                p0_scan_io <= (p0_scan_io << 1) | p0_scan_out;
                if(p0_scan_cnt != 0) begin
                    p0_scan_enable <= 1;
                    p0_scan_cnt <= p0_scan_cnt - 1;
                end else begin
                    p0_scan_in_progress <= 0;
                    p0_scan_done_strobe <= 1;
                end
            end else if(p0_scan_done_strobe == 1) begin
                //p0_scan_enable <= 1;
                ; //nothing to do here
            end
        end
    end

    

    accumulator_microcontroller #(
        .MEM_SIZE(256)
    ) qtcore_C1_p0 (
        .clk(clk),
        .rst(rst),
        .scan_enable(p0_scan_enable_final),
        .scan_in(p0_scan_in_final),
        .scan_out(p0_scan_out),
        .proc_en(p0_proc_en_final),
        .halt(p0_halt_out),
        .IO_in(io_in_reg),    
        .IO_out(p0_io_out),   
        .INT_out(p0_irq_out),
        .SIG_IN(p0_sig_in),
        .SIG_OUT(p0_sig_out)     
    );

    assign irq[0] = p0_irq_out & p0_proc_go;
    
    assign wbs_dat_o = (wbs_adr_i[7:0] == 8'h00) ? {p0_scan_wbs} : 
                       (wbs_adr_i[7:0] == 8'h04) ? {29'h0, p0_halt_out, p0_proc_go, p0_scan_enable} :
                       (wbs_adr_i[7:0] == 8'h08) ? {24'h0, p0_sig_in_reg} :
                       {26'h0, p0_sig_out};

endmodule

`default_nettype wire
