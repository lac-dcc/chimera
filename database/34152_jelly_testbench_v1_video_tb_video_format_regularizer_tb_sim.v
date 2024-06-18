// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_sim();
    
    initial begin
        $dumpfile("tb_sim.vcd");
        $dumpvars(0, tb_sim);
    
    #20000000
        $finish;
    end
    

    // -----------------------------
    //  reset & clock
    // -----------------------------

    localparam RATE100  = 10.0;
    localparam RATE250  =  5.0;

    reg     reset = 1'b1;
    initial #(RATE100*100)  reset = 1'b0;

    reg     clk100 = 1'b1;
    always #(RATE100/2.0)  clk100 = ~clk100;
    
    reg     clk250 = 1'b1;
    always #(RATE250/2.0)  clk250 = ~clk250;


    // -----------------------------
    //  main
    // -----------------------------

    parameter   WB_ADR_WIDTH = 8;
    parameter   WB_DAT_WIDTH = 32;
    parameter   WB_SEL_WIDTH = (WB_DAT_WIDTH / 8);

    wire                        s_wb_rst_i = reset;
    wire                        s_wb_clk_i = clk100;
    wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o;
    wire                        s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i;
    wire                        s_wb_stb_i;
    wire                        s_wb_ack_o;

    tb_sim_main
            #(
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                .WB_SEL_WIDTH       (WB_SEL_WIDTH)
            )
        i_sim_main
            (
                .aresetn            (~reset),
                .aclk               (clk250),

                .s_wb_rst_i         (s_wb_rst_i),
                .s_wb_clk_i         (s_wb_clk_i),
                .s_wb_adr_i         (s_wb_adr_i),
                .s_wb_dat_i         (s_wb_dat_i),
                .s_wb_dat_o         (s_wb_dat_o),
                .s_wb_we_i          (s_wb_we_i),
                .s_wb_sel_i         (s_wb_sel_i),
                .s_wb_stb_i         (s_wb_stb_i),
                .s_wb_ack_o         (s_wb_ack_o)
            );



    // ----------------------------------
    //  WISHBONE
    // ----------------------------------
    
    wire                            wb_rst_i = s_wb_rst_i;
    wire                            wb_clk_i = s_wb_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i = s_wb_dat_o;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i = s_wb_ack_o;
    
    assign s_wb_adr_i = wb_adr_o;
    assign s_wb_dat_i = wb_dat_o;
    assign s_wb_we_i  = wb_we_o;
    assign s_wb_sel_i = wb_sel_o;
    assign s_wb_stb_i = wb_stb_o;
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_ack_i ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    
    task wb_write(
                input [31:0]    adr,
                input [31:0]    dat,
                input [3:0]     sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = dat;
            wb_sel_o = sel;
            wb_we_o  = 1'b1;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
    end
    endtask
    
    task wb_read(
                input [31:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'b1}};
            wb_we_o  = 1'b0;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
            $display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
    end
    endtask


    localparam  ADR_CORE_ID            = 8'h00;
    localparam  ADR_CORE_VERSION       = 8'h01;
    localparam  ADR_CTL_CONTROL        = 8'h04;
    localparam  ADR_CTL_STATUS         = 8'h05;
    localparam  ADR_CTL_INDEX          = 8'h07;
    localparam  ADR_CTL_SKIP           = 8'h08;
    localparam  ADR_CTL_FRM_TIMER_EN   = 8'h0a;
    localparam  ADR_CTL_FRM_TIMEOUT    = 8'h0b;
    localparam  ADR_PARAM_WIDTH        = 8'h10;
    localparam  ADR_PARAM_HEIGHT       = 8'h11;
    localparam  ADR_PARAM_FILL         = 8'h12;
    localparam  ADR_PARAM_TIMEOUT      = 8'h13;
    
    initial begin
        #(RATE100*200);
        $display("start");
        wb_read(ADR_CORE_ID);
        wb_read(ADR_CORE_VERSION);
        wb_read(ADR_CTL_CONTROL);
        wb_read(ADR_CTL_STATUS);
        wb_read(ADR_CTL_INDEX);
        wb_read(ADR_CTL_SKIP);
        wb_read(ADR_CTL_FRM_TIMER_EN);
        wb_read(ADR_CTL_FRM_TIMEOUT);
        wb_read(ADR_PARAM_WIDTH);
        wb_read(ADR_PARAM_HEIGHT);
        wb_read(ADR_PARAM_FILL);
        wb_read(ADR_PARAM_TIMEOUT);
                
        #(RATE100*100);
        $display("enable");
        wb_write(ADR_CTL_CONTROL, 1, 4'b1111);
        wb_read(ADR_CTL_STATUS);
        
        #200000;
        $display("disable");
        wb_write(ADR_CTL_CONTROL, 0, 4'b1111);
        wb_read(ADR_CTL_STATUS);
        
        #200000;
        $display("enable");
        wb_write(ADR_CTL_CONTROL, 1, 4'b1111);
        wb_read(ADR_CTL_STATUS);
        
        // frame timeout
        #200000;
        $display("frame timeout");
        wb_write(ADR_CTL_FRM_TIMEOUT, 100000, 4'b1111);
        wb_write(ADR_CTL_FRM_TIMER_EN, 1, 4'b1111);
        wb_write(ADR_PARAM_FILL, 24'hff0000, 4'b1111);
        wb_write(ADR_CTL_CONTROL, 3, 4'b1111);

        #1000000;
        wb_write(ADR_PARAM_FILL, 24'h0000ff, 4'b1111);
        wb_write(ADR_CTL_CONTROL, 3, 4'b1111);
    end
    
    
endmodule


`default_nettype wire


// end of file
