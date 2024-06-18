// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

module ddr3_test1 (
    input          i_clk    ,
    input          i_rst_n,
    output         mem_rst_n,
    output         mem_ck,
    output         mem_ck_n,
    output         mem_cke,
    output         mem_cs_n,
    output         mem_ras_n,
    output         mem_cas_n,
    output         mem_we_n,
    output         mem_odt,
    output [14:0]  mem_a,
    output [2:0]   mem_ba,
    inout  [3:0]   mem_dqs,
    inout  [3:0]   mem_dqs_n,
    inout  [31:0]  mem_dq,
    output [3:0]   mem_dm,
    output  reg    led_flag,
    output  reg    err_flag,
    output         wr_finish,
    output         rd_finish
);

  wire        core_clk/*synthesis PAP_MARK_DEBUG="1"*/ ;

  reg [27:0]  axi_awaddr /*synthesis PAP_MARK_DEBUG="1"*/;
  wire        axi_awready /*synthesis PAP_MARK_DEBUG="1"*/;
  reg         axi_awvalid /*synthesis PAP_MARK_DEBUG="1"*/;

  wire [255:0] axi_wdata /*synthesis PAP_MARK_DEBUG="1"*/;
  wire        axi_wready /*synthesis PAP_MARK_DEBUG="1"*/;
  wire        axi_wusero_last /*synthesis PAP_MARK_DEBUG="1"*/;

  reg [27:0] axi_araddr /*synthesis PAP_MARK_DEBUG="1"*/; 
  reg [27:0] axi_araddr_d0/*synthesis PAP_MARK_DEBUG="1"*/;  
  wire        axi_arready /*synthesis PAP_MARK_DEBUG="1"*/;
  reg         axi_arvalid /*synthesis PAP_MARK_DEBUG="1"*/;

  wire [255:0] axi_rdata /*synthesis PAP_MARK_DEBUG="1"*/;
  wire         axi_rlast /*synthesis PAP_MARK_DEBUG="1"*/;
  wire         axi_rvalid /*synthesis PAP_MARK_DEBUG="1"*/;

  wire         ddr_init_ok_pos;

  reg  [25:0]  wr_data /*synthesis PAP_MARK_DEBUG="1"*/;
  wire  [25:0]  rd_data /*synthesis PAP_MARK_DEBUG="1"*/;

  reg  [25:0]  rd_cnt /*synthesis PAP_MARK_DEBUG="1"*/;
  reg  [27:0]  wr_addr_cnt /*synthesis PAP_MARK_DEBUG="1"*/;
  reg  [27:0]  rd_addr_cnt /*synthesis PAP_MARK_DEBUG="1"*/;

  reg  [27:0]  led_cnt;
  wire         ddr_init_done /*synthesis PAP_MARK_DEBUG="1"*/;
  reg          ddr_init_done0 /*synthesis PAP_MARK_DEBUG="1"*/;
  reg          ddr_init_ok /*synthesis PAP_MARK_DEBUG="1"*/;
  reg  [255:0]        axi_rdata_d0/*synthesis PAP_MARK_DEBUG="1"*/;
assign axi_wdata =wr_data[25:0];
assign rd_data = axi_rdata[25:0];
reg    wr_finish_d0;
reg    wr_finish_d1;
reg    axi_awvalid_d0/*synthesis PAP_MARK_DEBUG="1"*/;

assign ddr_init_ok_pos =ddr_init_done0&!ddr_init_ok;
assign wr_finish = axi_awaddr >= 28'hfff_f80;
assign rd_finish = axi_araddr >= 28'hfff_f80;


always @(posedge core_clk ) begin
    ddr_init_done0 <= ddr_init_done;
    ddr_init_ok <= ddr_init_done0;
    axi_rdata_d0<= axi_rdata;
    axi_awvalid_d0 <= axi_awvalid;
    axi_araddr_d0  <= axi_araddr;
    wr_finish_d0 <= wr_finish;
    wr_finish_d1 <= wr_finish_d0;
end
//写数据
always @(posedge core_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        axi_awvalid <= 1'b0;
        axi_awaddr  <= 'b0;
        wr_addr_cnt<= 'b0;
    end
    else if (wr_finish) begin
        axi_awvalid <= 1'b0;
        axi_awaddr  <= axi_awaddr;
        wr_addr_cnt <= wr_addr_cnt;
    end
    else if (ddr_init_ok_pos) begin
        axi_awvalid <= 1'b1;
        axi_awaddr  <= wr_addr_cnt;
        wr_addr_cnt <= wr_addr_cnt + 'd128;
    end
    else if (axi_awvalid & axi_awready) begin
        axi_awvalid <= axi_awvalid;
        axi_awaddr  <= wr_addr_cnt;
        wr_addr_cnt <= wr_addr_cnt + 'd128;
    end
end

always @(posedge core_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        wr_data <= 'b0;
    end    
    else if(axi_wready) begin
        wr_data <= wr_data + 1'b1;
    end
end

//读数据
always @(posedge core_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        axi_arvalid <= 1'b0;
        axi_araddr  <= 'b0;
        rd_addr_cnt<= 'b0;
    end
    else if (rd_finish) begin
        axi_arvalid <= 1'b0;
        axi_araddr  <= axi_araddr;
        rd_addr_cnt <= rd_addr_cnt;
    end
    else if ((~wr_finish_d1)&wr_finish_d0) begin
        axi_arvalid <= 1'b1;
        axi_araddr  <= rd_addr_cnt;
        rd_addr_cnt  <= rd_addr_cnt+'d128;
    end
    else if (axi_arvalid & axi_arready) begin
        axi_arvalid <= axi_arvalid;
        axi_araddr  <= rd_addr_cnt;
        rd_addr_cnt  <= rd_addr_cnt+'d128;
    end
end

always @(posedge core_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        rd_cnt <= 'b0;
    end
    else if (axi_rvalid) begin
        rd_cnt <= rd_cnt + 1'b1;
    end
    else begin
        rd_cnt <= rd_cnt;
    end
end

always @(posedge core_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        err_flag <= 1'b0;
    end
    else if (axi_rvalid & rd_data != rd_cnt) begin
        err_flag <= 1'b1;
    end
end

ddr3_test the_instance_name (
  .resetn(i_rst_n),                                      // input
  .ref_clk(i_clk),
  .ddr_init_done(ddr_init_done),                        // output
  .ddrphy_clkin(core_clk),                          // output
  .pll_lock(pll_lock),                                  // output

  .axi_awaddr(axi_awaddr),                              // input [27:0]
  .axi_awuser_ap(1'b0),                        // input
  .axi_awuser_id(4'b0),                        // input [3:0]
  .axi_awlen(4'd15),                                // input [3:0]
  .axi_awready(axi_awready),                            // output
  .axi_awvalid(axi_awvalid),                            // input
  
  .axi_wdata(axi_wdata),
  .axi_wstrb(32'hffffffff),                                // input [31:0]
  .axi_wready(axi_wready),                              // output
  .axi_wusero_id(),                        // output [3:0]
  .axi_wusero_last(axi_wusero_last),                    // output

  .axi_araddr(axi_araddr),                              // input [27:0]
  .axi_aruser_ap(1'b0),                        // input
  .axi_aruser_id(4'b0),                        // input [3:0]
  .axi_arlen(4'd15),                                // input [3:0]
  .axi_arready(axi_arready),                            // output
  .axi_arvalid(axi_arvalid),                            // input

  .axi_rdata(axi_rdata),                                // output [255:0]
  .axi_rid(axi_rid),                                    // output [3:0]
  .axi_rlast(axi_rlast),                                // output
  .axi_rvalid(axi_rvalid),                              // output

  .apb_clk(1'b0),                                    // input
  .apb_rst_n(1'b1),                                // input
  .apb_sel(1'b0),                                    // input
  .apb_enable(1'b0),                              // input
  .apb_addr(1'b0),                                  // input [7:0]
  .apb_write(1'b0),                                // input
  .apb_ready(),                                // output
  .apb_wdata(16'b0),                                // input [15:0]
  .apb_rdata(),                                // output [15:0]
  .apb_int(),                                    // output

  .debug_data(),                              // output [135:0]
  .debug_slice_state(),                // output [51:0]
  .debug_calib_ctrl(),                  // output [21:0]
  .ck_dly_set_bin(),                      // output [7:0]
  .force_ck_dly_en(1'b0),                    // input
  .force_ck_dly_set_bin(8'h05),          // input [7:0]
  .dll_step(),                                  // output [7:0]
  .dll_lock(),                                  // output
  .init_read_clk_ctrl(2'b0),              // input [1:0]
  .init_slip_step(4'b0),                      // input [3:0]
  .force_read_clk_ctrl(1'b0),            // input
  .ddrphy_gate_update_en(1'b0),        // input
  .update_com_val_err_flag(),    // output [3:0]
  .rd_fake_stop(1'b0),                          // input

  .mem_rst_n(mem_rst_n),                                // output
  .mem_ck(mem_ck),                                      // output
  .mem_ck_n(mem_ck_n),                                  // output
  .mem_cke(mem_cke),                                    // output
  .mem_cs_n(mem_cs_n),                                  // output
  .mem_ras_n(mem_ras_n),                                // output
  .mem_cas_n(mem_cas_n),                                // output
  .mem_we_n(mem_we_n),                                  // output
  .mem_odt(mem_odt),                                    // output
  .mem_a(mem_a),                                        // output [14:0]
  .mem_ba(mem_ba),                                      // output [2:0]
  .mem_dqs(mem_dqs),                                    // inout [3:0]
  .mem_dqs_n(mem_dqs_n),                                // inout [3:0]
  .mem_dq(mem_dq),                                      // inout [31:0]
  .mem_dm(mem_dm)                                       // output [3:0]
);

endmodule