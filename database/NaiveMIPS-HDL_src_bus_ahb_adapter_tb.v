`timescale 1ns/1ns
module ahb_adapter_tb (
    
);

reg clk = 0;
reg rst_n = 0;

always #5 clk = ~clk;

reg[31:0] address1 = 0;
reg[31:0] wrdata1 = 0;
wire[31:0] rddata1;
reg[3:0] dataenable1 = 0;
reg rd1 = 0;
reg wr1 = 0;
wire stall1;

initial begin 
    repeat(10) @(posedge clk);
    #1 rst_n = 1;
    repeat(5) @(posedge clk);


    #1;
    dataenable1 = 4'hf;
    address1 = 'h4;
    rd1 = 0;
    wr1 = 1;
    wrdata1 = 'hdeadbeef;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);


    #1;
    address1 = 'h0;
    rd1 = 0;
    wr1 = 1;
    wrdata1 = 'haaff0101;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);

        
    #1;
    address1 = 'h0;
    rd1 = 1;
    wr1 = 0;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);


    #1;
    address1 = 'h6;
    dataenable1 = 4'b1100;
    rd1 = 0;
    wr1 = 1;
    wrdata1 = 'hface0000;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);


    #1;
    address1 = 'h1;
    dataenable1 = 4'b0010;
    rd1 = 0;
    wr1 = 1;
    wrdata1 = 'h02ff;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);


    #1;
    dataenable1 = 4'hf;
    address1 = 'h0;
    rd1 = 1;
    wr1 = 0;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);

    #1;
    address1 = 'h4;
    rd1 = 1;
    wr1 = 0;
    @(posedge clk);
    while(stall1 == 1)
        @(posedge clk);

    #1;
    rd1=0;
    wr1=0;
    @(posedge clk);


end

wire [31:0]AHB1_haddr;
wire [2:0]AHB1_hburst;
wire [3:0]AHB1_hprot;
wire [31:0]AHB1_hrdata;
wire AHB1_hready_in;
wire AHB1_hready_out;
wire AHB1_hresp;
wire [2:0]AHB1_hsize;
wire [1:0]AHB1_htrans;
wire [31:0]AHB1_hwdata;
wire AHB1_hwrite;
wire AHB1_sel;

wire[17:0] emc_addr;
wire[15:0] emc_data;
wire[15:0] EMC_INTF_dq_i,EMC_INTF_dq_o,EMC_INTF_dq_t;
wire emc_oen,emc_wen,emc_cen,emc_lbn,emc_ubn;

assign EMC_INTF_dq_i = emc_data;

genvar i;
generate
    for(i=0;i<16;i=i+1)begin 
        assign emc_data[i] = EMC_INTF_dq_t[i]?1'bz:EMC_INTF_dq_o[i];
    end
endgenerate

ahb_adapter bridge1(
    .clk           (clk),
    .rst_n         (rst_n),
    .AHB_haddr     (AHB1_haddr),
    .AHB_hburst    (AHB1_hburst),
    .AHB_hprot     (AHB1_hprot),
    .AHB_hrdata    (AHB1_hrdata),
    .AHB_hready_in (AHB1_hready_in),
    .AHB_hready_out(AHB1_hready_out),
    .AHB_hresp     (AHB1_hresp),
    .AHB_hsize     (AHB1_hsize),
    .AHB_htrans    (AHB1_htrans),
    .AHB_hwdata    (AHB1_hwdata),
    .AHB_hwrite    (AHB1_hwrite),
    .AHB_sel       (AHB1_sel),
    .address       (address1),
    .wrdata        (wrdata1),
    .rddata        (rddata1),
    .dataenable    (dataenable1),
    .rd            (rd1),
    .wr            (wr1),
    .stall         (stall1)
);
sim_ahb_slave slave(
    .AHB_haddr     (AHB1_haddr),
    .AHB_hburst    (AHB1_hburst),
    .AHB_hprot     (AHB1_hprot),
    .AHB_hrdata    (AHB1_hrdata),
    .AHB_hready_in (AHB1_hready_in),
    .AHB_hready_out(AHB1_hready_out),
    .AHB_hresp     (AHB1_hresp),
    .AHB_hsize     (AHB1_hsize),
    .AHB_htrans    (AHB1_htrans),
    .AHB_hwdata    (AHB1_hwdata),
    .AHB_hwrite    (AHB1_hwrite),
    .AHB_sel       (AHB1_sel),

    .EMC_INTF_addr   (emc_addr),
    .EMC_INTF_ce_n   (emc_cen),
    .EMC_INTF_oen    (emc_oen),
    .EMC_INTF_wen    (emc_wen),
    .EMC_INTF_dq_i   (EMC_INTF_dq_i),
    .EMC_INTF_dq_o   (EMC_INTF_dq_o),
    .EMC_INTF_dq_t   (EMC_INTF_dq_t),
    .EMC_INTF_ben    ({emc_ubn,emc_lbn}),
    .EMC_INTF_wait   (0),

    .s_ahb_hclk(clk),
    .s_ahb_hresetn(rst_n)

    );
AS7C34098A ram(
    .Address(emc_addr), 
    .DataIO(emc_data), 
    .OE_n(emc_oen), 
    .CE_n(emc_cen),
    .WE_n(emc_wen), 
    .LB_n(emc_lbn), 
    .UB_n(emc_ubn)
    );

endmodule