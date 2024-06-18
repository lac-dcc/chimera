// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module design_4_wrapper_tb();
    localparam T = 8;
    
    // *** Multiplier ***
    reg [31:0]BRAM_PORTA_addr;
    reg [31:0]BRAM_PORTA_din;
    wire [31:0]BRAM_PORTA_dout;
    reg BRAM_PORTA_en;
    reg [3:0]BRAM_PORTA_we;
    reg [31:0]BRAM_PORTB_addr;
    reg [31:0]BRAM_PORTB_din;
    wire [31:0]BRAM_PORTB_dout;
    reg BRAM_PORTB_en;
    reg [3:0]BRAM_PORTB_we;
    reg clk;
    reg rst_n;
    
    // *** AXI control ***
    wire s_axi_arready;
    reg [31:0] s_axi_araddr;
    reg s_axi_arvalid;
    wire s_axi_awready;
    reg [31:0] s_axi_awaddr;
    reg s_axi_awvalid;
    reg s_axi_bready;
    wire [1:0] s_axi_bresp;
    wire s_axi_bvalid;
    reg s_axi_rready;
    wire [31:0] s_axi_rdata;
    wire [1:0] s_axi_rresp;
    wire s_axi_rvalid;
    wire s_axi_wready;
    reg [31:0] s_axi_wdata;
    reg [3:0] s_axi_wstrb;
    reg s_axi_wvalid;
    
    integer i; 
    
    design_4_wrapper uut
    (
        .BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_dout(BRAM_PORTA_dout),
        .BRAM_PORTA_en(BRAM_PORTA_en),
        .BRAM_PORTA_we(BRAM_PORTA_we),
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_din(BRAM_PORTB_din),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .BRAM_PORTB_we(BRAM_PORTB_we),
        .clk(clk),
        .rst_n(rst_n),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid)
    );
    
    always
    begin
        // *** Clock ***
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end

    initial
    begin
        // *** Init ***
        BRAM_PORTA_addr = 0;
        BRAM_PORTA_din = 0;
        BRAM_PORTA_en = 1;
        BRAM_PORTA_we = 0;
        BRAM_PORTB_addr = 0;
        BRAM_PORTB_din = 0;
        BRAM_PORTB_en = 1;
        BRAM_PORTB_we = 0;
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        s_axi_wstrb = 0;
        s_axi_wdata = 0;
        s_axi_wvalid = 0;
        s_axi_bready = 1;
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        s_axi_rready = 1;
        
        // *** Reset ***
        rst_n = 0;
        #(T*5);
        rst_n = 1;
        #(T*5);
        
        // ### 1 ###
        BRAM_PORTA_we = 1;
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTA_addr = i;
            BRAM_PORTA_din = i+4;
            #T;
        end
        BRAM_PORTA_we = 0;
        #(T*10);
        
        // *** Configuration and start ***
        axi_control_write(4'h4, 8'd25);
        axi_control_write(4'h0, 12'h420);
        
        // Wait until process is done
        #(T*50);
        axi_control_read(4'h0);
        
        // *** Read output ***
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
        #(T*10);
        
        // ### 2 ###
        BRAM_PORTA_we = 1;
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTA_addr = i;
            BRAM_PORTA_din = i+4;
            #T;
        end
        BRAM_PORTA_we = 0;
        #(T*10);
        
        // *** Configuration and start ***
        axi_control_write(4'h4, 8'd10);
        axi_control_write(4'h0, 12'h420);
        // Wait until process is done
        #(T*50);
        axi_control_read(4'h0);
        // *** Read output ***
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
        #(T*10);
        
        // ### 3 ###
        BRAM_PORTA_we = 1;
        for (i = 0; i < 8; i = i+4)
        begin
            BRAM_PORTA_addr = i;
            BRAM_PORTA_din = i+4;
            #T;
        end
        BRAM_PORTA_we = 0;
        #(T*10);
        
        // *** Configuration and start ***
        axi_control_write(4'h4, 8'd5);
        axi_control_write(4'h0, 12'h408); // Wait until process is done
        #(T*50);
        axi_control_read(4'h0);
        // *** Read output ***
        for (i = 0; i < 8; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
        #(T*10);
        
        // ### 4 ###
        // *** Configuration and start ***
        axi_control_write(4'h4, 8'd3);
        axi_control_write(4'h0, 12'h400); // Wait until process is done
        #(T*50);
        axi_control_read(4'h0);
    end
        
    task axi_control_write;
        input [31:0] awaddr;
        input [31:0] wdata;
        begin // *** Write address ***
            s_axi_awaddr = awaddr;
            s_axi_awvalid = 1;
            #T;
            s_axi_awvalid = 0; // *** Write data ***
            s_axi_wdata = wdata;
            s_axi_wstrb = 4'hf;
            s_axi_wvalid = 1;
            #T;
            s_axi_wvalid = 0;
            #T;
         end
     endtask
     
     task axi_control_read;
        input [31:0] araddr;
        begin
            // *** Read address ***
            s_axi_araddr = araddr;
            s_axi_arvalid = 1;
            #T; s_axi_arvalid = 0;
            #T;
        end
    endtask

endmodule
