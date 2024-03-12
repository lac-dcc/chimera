`timescale 1ns/1ns
module DCache_tb (
    
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
reg invalidate = 0;
reg writeback = 0;

reg [7:0] answer[0:1024*1024-1]; //1MiB RAM
reg[31:0] daddr, phyaddr;
reg[31:0] dwrdata;
reg[3:0] byte_en;
reg d_rw;

initial begin : tb_block
    integer i;
    
    repeat(5) @(posedge clk);
    #1 rst_n = 1;
    repeat(5) @(posedge clk);

    for (i = 0; i < 1024*1024; i = i + 1) begin
        answer[i] = 8'b0;
        ram.mem_array0[i] = 0;
        ram.mem_array1[i] = 0;
    end

    $display("Starting cache test program");

    repeat (1000000) begin 

      daddr = ($urandom_range(0, 1024*8-1) << 2);// + 32'b10100;
      byte_en = 4'b1111; //$urandom_range(0, 15); //4'b1111;
      d_rw = ($random & 1) ? 0 : 1;
      dwrdata = $urandom;
      
      #1;
      dataenable1 = byte_en;
      address1 = daddr;
      rd1 = d_rw == 0;
      wr1 = d_rw == 1;
      wrdata1 = dwrdata;
      @(posedge clk);
      while(stall1 == 1)
          @(posedge clk);
      if (d_rw == 0) @(posedge clk);
      
      if (d_rw == 1) begin 
          if (byte_en[0]) answer[daddr] = dwrdata[7:0];
          if (byte_en[1]) answer[daddr+1] = dwrdata[15:8];
          if (byte_en[2]) answer[daddr+2] = dwrdata[23:16];
          if (byte_en[3]) answer[daddr+3] = dwrdata[31:24];
          $display("Write: [%h]=%h BE=%b", daddr, dwrdata, byte_en);
      end else if (d_rw == 0) begin 
          if (answer[daddr] != rddata1[7:0] ||
              answer[daddr+1] != rddata1[15:8] ||
              answer[daddr+2] != rddata1[23:16] ||
              answer[daddr+3] != rddata1[31:24]) begin
              $display("Read Failed: [%h]=%h v.s %h %h %h %h BE=%b", daddr, rddata1,
                answer[daddr], answer[daddr+1], answer[daddr+2], answer[daddr+3], byte_en);
              $stop;
          end
          $display("Read Success: [%h]=%h v.s %h %h %h %h BE=%b", daddr, rddata1,
            answer[daddr], answer[daddr+1], answer[daddr+2], answer[daddr+3], byte_en);
      end
      
    end
    $display("Pass");
    $stop;

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

DCache #(
	.TAG_WIDTH        (22)
) cache (
    .nrst          (rst_n),
    .clk           (clk),
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
    .dbus_addr     (address1),
    .dbus_wrdata   (wrdata1),
    .dbus_rddata   (rddata1),
    .dbus_byteenable   (dataenable1),
    .dbus_read     (rd1),
    .dbus_write    (wr1),
    .dbus_stall    (stall1),
    .dbus_hitwriteback (writeback),
    .dbus_hitinvalidate(invalidate)
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
