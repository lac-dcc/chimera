// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 10 May 2018
`timescale 1ns / 1ps

module axi_dnn_tb();
    localparam T = 10;

    // *** Clock and reset ***
    reg aclk;
    reg aresetn;
    // *** AXI4-lite TX ***
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

    axi_dnn uut
    (
        .aclk(aclk),
        .aresetn(aresetn),
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
        aclk = 0;
        #(T/2);
        aclk = 1;
        #(T/2);
    end

    initial
    begin
        // *** Initialization ***************************************************
        // Write address
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        // Write data
        s_axi_wstrb = 0;
        s_axi_wdata = 0;
        s_axi_wvalid = 0;
        // Write response
        s_axi_bready = 1;
        // Read address
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        // Read data
        s_axi_rready = 1;
        // *** Reset ***
        aresetn = 0;
        #(T*5);
        aresetn = 1;
        #(T*5);
        
        // *** Weight hidden 1 ***        
        axi_write(10'h10, 512);
        axi_write(10'h14, 410);
        axi_write(10'h18, 205);
        axi_write(10'h1c, 410);
        axi_write(10'h20, 0);
        axi_write(10'h24, 717);
        axi_write(10'h28, 819);
        axi_write(10'h2c, 410);
//        axi_write(10'h10, 16'b0000000001100110);
//        axi_write(10'h14, 16'b00_0000_1011_0011_00);
//        axi_write(10'h18, 16'b0000001100110011);
//        axi_write(10'h1c, 16'b0000001001100110);
//        axi_write(10'h20, 16'b00_0000_0001_1001_10);
//        axi_write(10'h24, 16'b0000000011001100);
//        axi_write(10'h28, 16'b0000000001100110);
//        axi_write(10'h2c, 16'b00_0000_1011_0011_00);
        axi_write(10'h30, 717);
        axi_write(10'h34, 410);
        axi_write(10'h38, 102);
        axi_write(10'h3c, 717);
        axi_write(10'h40, 819);
        axi_write(10'h44, 717);
        axi_write(10'h48, 410);
        axi_write(10'h4c, 205);
        axi_write(10'h50, 512);
        axi_write(10'h54, 410);
        axi_write(10'h58, 717);
        axi_write(10'h5c, 717);
        axi_write(10'h60, 205);
        axi_write(10'h64, 410);
        axi_write(10'h68, 922);
        axi_write(10'h6c, 819);
        axi_write(10'h70, 1024);
        axi_write(10'h74, 819);
        axi_write(10'h78, 102);
        axi_write(10'h7c, 512);
        axi_write(10'h80, 410);
        axi_write(10'h84, 0);
        axi_write(10'h88, 410);
        axi_write(10'h8c, 922);
        axi_write(10'h90, 205);
        axi_write(10'h94, 614);
        axi_write(10'h98, 512);
        axi_write(10'h9c, 307);
        axi_write(10'ha0, 717);
        axi_write(10'ha4, 307);
        axi_write(10'ha8, 819);
        axi_write(10'hac, 307);
        axi_write(10'hb0, 102);
        axi_write(10'hb4, 819);
        axi_write(10'hb8, 512);
        axi_write(10'hbf, 102);
        axi_write(10'hc0, 417);
        axi_write(10'hc4, 417);
        axi_write(10'hc8, 417);
        axi_write(10'hcc, 717);
        // *** Weight hidden 2 ***
        axi_write(10'hd0, 512);
        axi_write(10'hd4, 410);
        axi_write(10'hd8, 205);
        axi_write(10'hdc, 410);
        axi_write(10'he0, 0);
        axi_write(10'he4, 717);
        axi_write(10'he8, 717);
        axi_write(10'hec, 410);
        axi_write(10'hf0, 102);
        axi_write(10'hf4, 717);
        axi_write(10'hf8, 819);
        axi_write(10'hfc, 717);
        axi_write(10'h100, 512);
        axi_write(10'h104, 410);
        axi_write(10'h108, 717);
        axi_write(10'h10c, 717);
        axi_write(10'h110, 205);
        axi_write(10'h114, 410);
        axi_write(10'h118, 1024);
        axi_write(10'h11c, 819);
        axi_write(10'h120, 102);
        axi_write(10'h124, 512);
        axi_write(10'h128, 410);
        axi_write(10'h12c, 0);
        axi_write(10'h130, 205);
        axi_write(10'h134, 614);
        axi_write(10'h138, 512);
        axi_write(10'h13c, 307);
        axi_write(10'h140, 717);
        axi_write(10'h144, 307);
        axi_write(10'h148, 102);
        axi_write(10'h14c, 819);
        axi_write(10'h150, 512);
        axi_write(10'h154, 102);
        axi_write(10'h158, 410);
        axi_write(10'h15c, 410);
        axi_write(10'h160, 102);
        axi_write(10'h164, 922);
        axi_write(10'h168, 922);
        axi_write(10'h16c, 614);
        axi_write(10'h170, 717);
        axi_write(10'h174, 307);
        axi_write(10'h178, 102);
        axi_write(10'h17c, 102);
        axi_write(10'h180, 512);
        axi_write(10'h184, 307);
        axi_write(10'h188, 410);
        axi_write(10'h18c, 205);
        axi_write(10'h190, 512);
        axi_write(10'h194, 410);
        axi_write(10'h198, 205);
        axi_write(10'h19c, 410);
        axi_write(10'h1a0, 717);
        axi_write(10'h1a4, 410);
        axi_write(10'h1a8, 102);
        axi_write(10'h1ac, 717);
        axi_write(10'h1b0, 512);
        axi_write(10'h1b4, 410);
        axi_write(10'h1b8, 717);
        axi_write(10'h1bc, 717);
        axi_write(10'h1c0, 102);
        axi_write(10'h1c4, 819);
        axi_write(10'h1c8, 102);
        axi_write(10'h1cc, 512);
        axi_write(10'h1d0, 205);
        axi_write(10'h1d4, 614);
        axi_write(10'h1d8, 512);
        axi_write(10'h1dc, 307);
        axi_write(10'h1e0, 102);
        axi_write(10'h1e4, 819);
        axi_write(10'h1e8, 512);
        axi_write(10'h1ec, 102);
        // *** Weight hidden 3 ***
        axi_write(10'h1f0, 512);
        axi_write(10'h1f4, 410);
        axi_write(10'h1f8, 717);
        axi_write(10'h1fc, 410);
        axi_write(10'h200, 512);
        axi_write(10'h204, 410);
        axi_write(10'h208, 1024);
        axi_write(10'h20c, 819);
        
        // *** Write input ***
        axi_write(10'h210, 512);
        axi_write(10'h214, 410);
        axi_write(10'h218, 205);
        axi_write(10'h21c, 410);
        axi_write(10'h220, 0);
        axi_write(10'h224, 717);
        axi_write(10'h228, 717);
        axi_write(10'h22c, 410);
        axi_write(10'h230, 102);
        axi_write(10'h234, 717);
        axi_write(10'h238, 819);
        axi_write(10'h23c, 717);
        axi_write(10'h240, 512);
        axi_write(10'h244, 410);
        axi_write(10'h248, 717);
        axi_write(10'h24c, 717);
        axi_write(10'h250, 205);
        axi_write(10'h254, 410);
        axi_write(10'h258, 1024);
        axi_write(10'h25c, 819);
        axi_write(10'h260, 102);
        axi_write(10'h264, 512);
        axi_write(10'h268, 410);
        axi_write(10'h26c, 0);        
        axi_write(10'h270, 205);
        axi_write(10'h274, 614);
        axi_write(10'h278, 512);
        axi_write(10'h27c, 307);
        axi_write(10'h280, 717);
        axi_write(10'h284, 307);
        axi_write(10'h288, 102);
        axi_write(10'h28c, 819);
        axi_write(10'h290, 512);
        axi_write(10'h294, 102);
        axi_write(10'h298, 410);
        axi_write(10'h29c, 410);
        axi_write(10'h2a0, 102);
        axi_write(10'h2a4, 922);
        axi_write(10'h2a8, 922);
        axi_write(10'h2ac, 614);
        axi_write(10'h2b0, 717);
        axi_write(10'h2b4, 307);
        axi_write(10'h2b8, 102);
        axi_write(10'h2bc, 102);
        axi_write(10'h2c0, 512);
        axi_write(10'h2c4, 307);
        axi_write(10'h2c8, 410);
        axi_write(10'h2cc, 205);
        
        #(T*100);
        
        for (i = 10'h210; i <= 10'h24c; i = i+4)
        begin
            axi_read(i);
            #T;
        end
    end

    task axi_write;
        input [31:0] awaddr;
        input [31:0] wdata; 
        begin
            // Write address
            s_axi_awaddr = awaddr;
            s_axi_awvalid = 1;
            #T;
            s_axi_awvalid = 0;
            // Write data
            s_axi_wdata = wdata;
            s_axi_wstrb = 4'hf;
            s_axi_wvalid = 1; 
            #T;
            s_axi_wvalid = 0;
            #T;
        end
    endtask
    
    task axi_read;
        input [31:0] araddr;
        begin
            // Read address
            s_axi_araddr = araddr;
            s_axi_arvalid = 1;
            #T;
            s_axi_arvalid = 0;
            #T;
        end
    endtask
    
endmodule
