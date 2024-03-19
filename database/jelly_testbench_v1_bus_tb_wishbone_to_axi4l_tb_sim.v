
`timescale 1ns / 1ps
`default_nettype none


module tb_sim();

    // -----------------------------
    //  simulation setting
    // -----------------------------

    initial begin
        $dumpfile("tb_sim.vcd");
        $dumpvars(0, tb_sim);
        
    #2000000
        $finish();
    end

    localparam RATE    = 10.0;

    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;

    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;


    // -----------------------------
    //  simulation target
    // -----------------------------

    parameter WB_ADR_WIDTH = 30;
    parameter WB_DAT_SIZE  = 2;
    parameter WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    parameter WB_SEL_WIDTH = WB_DAT_WIDTH / 8;

    wire                        s_wb_rst_i = reset;
    wire                        s_wb_clk_i = clk;
    wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i;
    wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i;
    wire                        s_wb_we_i;
    wire                        s_wb_stb_i;
    wire                        s_wb_ack_o;

    tb_sim_main
            #(
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                .WB_SEL_WIDTH       (WB_SEL_WIDTH)
            )
        i_sim_main
            (
                .s_wb_rst_i         (s_wb_rst_i),
                .s_wb_clk_i         (s_wb_clk_i),
                .s_wb_adr_i         (s_wb_adr_i),
                .s_wb_dat_o         (s_wb_dat_o),
                .s_wb_dat_i         (s_wb_dat_i),
                .s_wb_sel_i         (s_wb_sel_i),
                .s_wb_we_i          (s_wb_we_i ),
                .s_wb_stb_i         (s_wb_stb_i),
                .s_wb_ack_o         (s_wb_ack_o)
            );
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    // force connect to top-net
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
                input [WB_ADR_WIDTH-1:0]    adr,
                input [WB_DAT_WIDTH-1:0]    dat,
                input [WB_SEL_WIDTH-1:0]    sel
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
                input [WB_ADR_WIDTH-1:0]    adr
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
    
    
    initial begin
    #1000;
        $display(" --- read test --- ");
        wb_read (30'h00000001);
        wb_read (30'h00000002);
        wb_read (30'h00000003);
        wb_read (30'h00000004);
        wb_read (30'h11111111);
        wb_read (30'h22222222);
        wb_read (30'h12345678);
        
        $display(" --- write test --- ");
        wb_write(30'h00000001, 32'h00000001, 4'hf);
        wb_write(30'h00000002, 32'haaaaaaaa, 4'h8);
        wb_write(30'h00000003, 32'h55555555, 4'hf);
        wb_write(30'h00000004, 32'h12345678, 4'h2);
        wb_write(30'h11111111, 32'h87654321, 4'h5);
        wb_write(30'h22222222, 32'haaaa5555, 4'ha);
        wb_write(30'h12345678, 32'h5555aaaa, 4'hf);
        
    #2000;
        
        $finish();
    end
    
    
    
endmodule


`default_nettype wire


// end of file
