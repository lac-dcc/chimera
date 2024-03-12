// 
// Copyright 2018 Mohammad Amin Nili
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// 

module axi_interface
    #(parameter NUM_CORES               = 16,
    parameter   DATA_WIDTH              = 32,
    parameter   MEMORY_MAP_SIZE         = 64 * 1024,
    parameter   STROBE_WIDTH            = (DATA_WIDTH / 8),
    parameter   AXI_ADDR_WIDTH          = $clog2(MEMORY_MAP_SIZE * 4),
    parameter   SLV_ADDR_WIDTH          = AXI_ADDR_WIDTH - $clog2(STROBE_WIDTH))

    (input                              s_axi_aclk,
    input                               s_axi_aresetn,

    //Write Address Channel
    input                               s_axi_awvalid,
    input       [AXI_ADDR_WIDTH - 1: 0] s_axi_awaddr,
    output                              s_axi_awready,

    //Write Data Channel
    input                               s_axi_wvalid,
    input       [2:0]                   s_axi_awprot,
    input       [STROBE_WIDTH - 1: 0]   s_axi_wstrb,
    input       [DATA_WIDTH - 1: 0]     s_axi_wdata,
    output                              s_axi_wready,

    //Write Response Channel
    input                               s_axi_bready,
    output                              s_axi_bvalid,
    output      [1:0]                   s_axi_bresp,

    //Read Address Channel
    input                               s_axi_arvalid,
    input       [AXI_ADDR_WIDTH - 1: 0] s_axi_araddr,
    output                              s_axi_arready,

    //Read Data Channel
    input                               s_axi_rready,
    input       [2:0]                   s_axi_arprot,
    output                              s_axi_rvalid,
    output      [1:0]                   s_axi_rresp,
    output      [DATA_WIDTH - 1: 0]     s_axi_rdata);

    reg                                 unit_wack;
    wire                                unit_invalid_waddr;
    wire                                unit_wen;
    wire        [SLV_ADDR_WIDTH - 1: 0] unit_waddr;
    wire        [DATA_WIDTH - 1: 0]     unit_wdata;

    reg                                 unit_rstrb;
    wire                                unit_invalid_raddr;
    wire                                unit_ren;
    wire       [SLV_ADDR_WIDTH - 1: 0]  unit_raddr;

    wire       [15 : 0]                 axi_q;
    wire       [SLV_ADDR_WIDTH - 1: 0]  axi_addr;
    wire                                output_enable;
    wire [$clog2(NUM_CORES) - 1:0]      output_core_id;
    wire        [15:0]                  output_data_val;

    axi_slave #(
        .DATA_WIDTH(DATA_WIDTH),
        .MEMORY_MAP_SIZE(MEMORY_MAP_SIZE),
        .STROBE_WIDTH(STROBE_WIDTH),
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .SLV_ADDR_WIDTH(SLV_ADDR_WIDTH)
    ) axi_slave_inst (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),

        //Write Address Channel
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),

        //Write Data Channel
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),

        //Write Response Channel
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bresp(s_axi_bresp),

        //Read Address Channel
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arready(s_axi_arready),

        //Read Data Channel
        .s_axi_rready(s_axi_rready),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rdata(s_axi_rdata),


        //Unit Interface

        //Write Channel
        .unit_wack(unit_wack),
        .unit_invalid_waddr(unit_invalid_waddr),
        .unit_wen(unit_wen),
        .unit_waddr(unit_waddr),
        .unit_wdata(unit_wdata),

        //Read Channel
        .unit_rstrb(unit_rstrb),
        .unit_invalid_raddr(unit_invalid_raddr),
        .unit_rdata({16'h0, axi_q}),
        .unit_ren(unit_ren),
        .unit_raddr(unit_raddr));

    assign axi_addr = unit_wen ? unit_waddr : unit_raddr;

    assign unit_invalid_waddr = unit_waddr < (16'h4000) || (16'hFC00) <= unit_waddr;
    assign unit_invalid_raddr = unit_raddr < (16'h4000) || (16'hFC00) <= unit_raddr;

    always @(posedge s_axi_aclk) begin
        if (s_axi_aresetn == 0) begin
            unit_wack   <=  0;
            unit_rstrb  <=  0;
        end
        else begin
            if (~unit_wack && unit_wen) begin
                unit_wack   <=  1;
            end
            else begin
                unit_wack   <=  0;
            end

            if (~unit_rstrb && unit_ren) begin
                unit_rstrb   <=  1;
            end
            else begin
                unit_rstrb   <=  0;
            end
        end
    end

    pasc #(.NUM_CORES(NUM_CORES)) pasc(
       .clk(s_axi_aclk),
       .output_enable(output_enable),
       .output_core_id(output_core_id),
       .output_data_val(output_data_val),

       .axi_we(unit_wen),
       .axi_addr(axi_addr),
       .axi_data(unit_wdata[15:0]),
       .axi_q(axi_q));
endmodule
