/*

Copyright (c) 2017 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * XFCP Interface (UDP)
 */
module xfcp_interface_udp #(
    parameter ARP_CACHE_ADDR_WIDTH = 2,
    parameter ARP_REQUEST_RETRY_COUNT = 4,
    parameter ARP_REQUEST_RETRY_INTERVAL = 125000000*2,
    parameter ARP_REQUEST_TIMEOUT = 125000000*30,
    parameter UDP_CHECKSUM_GEN_ENABLE = 1,
    parameter UDP_CHECKSUM_PAYLOAD_FIFO_DEPTH = 2048,
    parameter UDP_CHECKSUM_HEADER_FIFO_DEPTH = 8
)
(
    input  wire         clk,
    input  wire         rst,

    /*
     * Ethernet interface
     */
    input  wire [7:0]   s_eth_axis_tdata,
    input  wire         s_eth_axis_tvalid,
    output wire         s_eth_axis_tready,
    input  wire         s_eth_axis_tlast,
    input  wire         s_eth_axis_tuser,

    output wire [7:0]   m_eth_axis_tdata,
    output wire         m_eth_axis_tvalid,
    input  wire         m_eth_axis_tready,
    output wire         m_eth_axis_tlast,
    output wire         m_eth_axis_tuser,

    /*
     * XFCP downstream interface
     */
    input  wire [7:0]   down_xfcp_in_tdata,
    input  wire         down_xfcp_in_tvalid,
    output wire         down_xfcp_in_tready,
    input  wire         down_xfcp_in_tlast,
    input  wire         down_xfcp_in_tuser,

    output wire [7:0]   down_xfcp_out_tdata,
    output wire         down_xfcp_out_tvalid,
    input  wire         down_xfcp_out_tready,
    output wire         down_xfcp_out_tlast,
    output wire         down_xfcp_out_tuser,

    /*
     * Configuration
     */
    input  wire [47:0] local_mac,
    input  wire [31:0] local_ip,
    input  wire [15:0] local_port,
    input  wire [31:0] gateway_ip,
    input  wire [31:0] subnet_mask
);

// Ethernet frame between Ethernet modules and UDP stack
wire rx_eth_hdr_ready;
wire rx_eth_hdr_valid;
wire [47:0] rx_eth_dest_mac;
wire [47:0] rx_eth_src_mac;
wire [15:0] rx_eth_type;
wire [7:0] rx_eth_payload_axis_tdata;
wire rx_eth_payload_axis_tvalid;
wire rx_eth_payload_axis_tready;
wire rx_eth_payload_axis_tlast;
wire rx_eth_payload_axis_tuser;

wire tx_eth_hdr_ready;
wire tx_eth_hdr_valid;
wire [47:0] tx_eth_dest_mac;
wire [47:0] tx_eth_src_mac;
wire [15:0] tx_eth_type;
wire [7:0] tx_eth_payload_axis_tdata;
wire tx_eth_payload_axis_tvalid;
wire tx_eth_payload_axis_tready;
wire tx_eth_payload_axis_tlast;
wire tx_eth_payload_axis_tuser;

// UDP frame connections
reg rx_udp_hdr_ready_reg = 1'b0, rx_udp_hdr_ready_next;
reg rx_udp_payload_axis_tready_reg = 1'b0, rx_udp_payload_axis_tready_next;

reg tx_udp_hdr_valid_reg = 1'b0, tx_udp_hdr_valid_next;
reg [31:0] tx_udp_ip_dest_ip_reg = 32'd0, tx_udp_ip_dest_ip_next;
reg [15:0] tx_udp_dest_port_reg = 16'd0, tx_udp_dest_port_next;

wire rx_udp_hdr_valid;
wire rx_udp_hdr_ready = rx_udp_hdr_ready_reg;
wire [47:0] rx_udp_eth_dest_mac;
wire [47:0] rx_udp_eth_src_mac;
wire [15:0] rx_udp_eth_type;
wire [3:0] rx_udp_ip_version;
wire [3:0] rx_udp_ip_ihl;
wire [5:0] rx_udp_ip_dscp;
wire [1:0] rx_udp_ip_ecn;
wire [15:0] rx_udp_ip_length;
wire [15:0] rx_udp_ip_identification;
wire [2:0] rx_udp_ip_flags;
wire [12:0] rx_udp_ip_fragment_offset;
wire [7:0] rx_udp_ip_ttl;
wire [7:0] rx_udp_ip_protocol;
wire [15:0] rx_udp_ip_header_checksum;
wire [31:0] rx_udp_ip_source_ip;
wire [31:0] rx_udp_ip_dest_ip;
wire [15:0] rx_udp_source_port;
wire [15:0] rx_udp_dest_port;
wire [15:0] rx_udp_length;
wire [15:0] rx_udp_checksum;
wire [7:0] rx_udp_payload_axis_tdata;
wire rx_udp_payload_axis_tvalid;
wire rx_udp_payload_axis_tready = rx_udp_payload_axis_tready_reg;
wire rx_udp_payload_axis_tlast;
wire rx_udp_payload_axis_tuser;

wire tx_udp_hdr_valid = tx_udp_hdr_valid_reg;
wire tx_udp_hdr_ready;
wire [5:0] tx_udp_ip_dscp = 6'd0;
wire [1:0] tx_udp_ip_ecn = 2'b00;
wire [7:0] tx_udp_ip_ttl = 8'd64;
wire [31:0] tx_udp_ip_source_ip = local_ip;
wire [31:0] tx_udp_ip_dest_ip = tx_udp_ip_dest_ip_reg;
wire [15:0] tx_udp_source_port = local_port;
wire [15:0] tx_udp_dest_port = tx_udp_dest_port_reg;
wire [15:0] tx_udp_length = 16'd0;
wire [15:0] tx_udp_checksum = 16'd0;

wire [7:0] tx_udp_payload_axis_tdata = down_xfcp_in_tdata;
wire tx_udp_payload_axis_tvalid = down_xfcp_in_tvalid;
wire tx_udp_payload_axis_tready;
wire tx_udp_payload_axis_tlast = down_xfcp_in_tlast;
wire tx_udp_payload_axis_tuser = down_xfcp_in_tuser;
assign down_xfcp_in_tready = tx_udp_payload_axis_tready;

eth_axis_rx
eth_axis_rx_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(s_eth_axis_tdata),
    .s_axis_tvalid(s_eth_axis_tvalid),
    .s_axis_tready(s_eth_axis_tready),
    .s_axis_tlast(s_eth_axis_tlast),
    .s_axis_tuser(s_eth_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(rx_eth_hdr_valid),
    .m_eth_hdr_ready(rx_eth_hdr_ready),
    .m_eth_dest_mac(rx_eth_dest_mac),
    .m_eth_src_mac(rx_eth_src_mac),
    .m_eth_type(rx_eth_type),
    .m_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Status signals
    .busy(),
    .error_header_early_termination()
);

eth_axis_tx
eth_axis_tx_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(tx_eth_hdr_valid),
    .s_eth_hdr_ready(tx_eth_hdr_ready),
    .s_eth_dest_mac(tx_eth_dest_mac),
    .s_eth_src_mac(tx_eth_src_mac),
    .s_eth_type(tx_eth_type),
    .s_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // AXI output
    .m_axis_tdata(m_eth_axis_tdata),
    .m_axis_tvalid(m_eth_axis_tvalid),
    .m_axis_tready(m_eth_axis_tready),
    .m_axis_tlast(m_eth_axis_tlast),
    .m_axis_tuser(m_eth_axis_tuser),
    // Status signals
    .busy()
);

udp_complete #(
    .ARP_CACHE_ADDR_WIDTH(ARP_CACHE_ADDR_WIDTH),
    .ARP_REQUEST_RETRY_COUNT(ARP_REQUEST_RETRY_COUNT),
    .ARP_REQUEST_RETRY_INTERVAL(ARP_REQUEST_RETRY_INTERVAL),
    .ARP_REQUEST_TIMEOUT(ARP_REQUEST_TIMEOUT),
    .UDP_CHECKSUM_GEN_ENABLE(UDP_CHECKSUM_GEN_ENABLE),
    .UDP_CHECKSUM_PAYLOAD_FIFO_DEPTH(UDP_CHECKSUM_PAYLOAD_FIFO_DEPTH),
    .UDP_CHECKSUM_HEADER_FIFO_DEPTH(UDP_CHECKSUM_HEADER_FIFO_DEPTH)
)
udp_complete_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(rx_eth_hdr_valid),
    .s_eth_hdr_ready(rx_eth_hdr_ready),
    .s_eth_dest_mac(rx_eth_dest_mac),
    .s_eth_src_mac(rx_eth_src_mac),
    .s_eth_type(rx_eth_type),
    .s_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(tx_eth_hdr_valid),
    .m_eth_hdr_ready(tx_eth_hdr_ready),
    .m_eth_dest_mac(tx_eth_dest_mac),
    .m_eth_src_mac(tx_eth_src_mac),
    .m_eth_type(tx_eth_type),
    .m_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // IP frame input
    .s_ip_hdr_valid(1'b0),
    .s_ip_hdr_ready(),
    .s_ip_dscp(6'd0),
    .s_ip_ecn(2'd0),
    .s_ip_length(16'd0),
    .s_ip_ttl(8'd0),
    .s_ip_protocol(8'd0),
    .s_ip_source_ip(32'd0),
    .s_ip_dest_ip(32'd0),
    .s_ip_payload_axis_tdata(8'd0),
    .s_ip_payload_axis_tvalid(1'b0),
    .s_ip_payload_axis_tready(),
    .s_ip_payload_axis_tlast(1'b0),
    .s_ip_payload_axis_tuser(1'b0),
    // IP frame output
    .m_ip_hdr_valid(),
    .m_ip_hdr_ready(1'b1),
    .m_ip_eth_dest_mac(),
    .m_ip_eth_src_mac(),
    .m_ip_eth_type(),
    .m_ip_version(),
    .m_ip_ihl(),
    .m_ip_dscp(),
    .m_ip_ecn(),
    .m_ip_length(),
    .m_ip_identification(),
    .m_ip_flags(),
    .m_ip_fragment_offset(),
    .m_ip_ttl(),
    .m_ip_protocol(),
    .m_ip_header_checksum(),
    .m_ip_source_ip(),
    .m_ip_dest_ip(),
    .m_ip_payload_axis_tdata(),
    .m_ip_payload_axis_tvalid(),
    .m_ip_payload_axis_tready(1'b1),
    .m_ip_payload_axis_tlast(),
    .m_ip_payload_axis_tuser(),
    // UDP frame input
    .s_udp_hdr_valid(tx_udp_hdr_valid),
    .s_udp_hdr_ready(tx_udp_hdr_ready),
    .s_udp_ip_dscp(tx_udp_ip_dscp),
    .s_udp_ip_ecn(tx_udp_ip_ecn),
    .s_udp_ip_ttl(tx_udp_ip_ttl),
    .s_udp_ip_source_ip(tx_udp_ip_source_ip),
    .s_udp_ip_dest_ip(tx_udp_ip_dest_ip),
    .s_udp_source_port(tx_udp_source_port),
    .s_udp_dest_port(tx_udp_dest_port),
    .s_udp_length(tx_udp_length),
    .s_udp_checksum(tx_udp_checksum),
    .s_udp_payload_axis_tdata(tx_udp_payload_axis_tdata),
    .s_udp_payload_axis_tvalid(tx_udp_payload_axis_tvalid),
    .s_udp_payload_axis_tready(tx_udp_payload_axis_tready),
    .s_udp_payload_axis_tlast(tx_udp_payload_axis_tlast),
    .s_udp_payload_axis_tuser(tx_udp_payload_axis_tuser),
    // UDP frame output
    .m_udp_hdr_valid(rx_udp_hdr_valid),
    .m_udp_hdr_ready(rx_udp_hdr_ready),
    .m_udp_eth_dest_mac(rx_udp_eth_dest_mac),
    .m_udp_eth_src_mac(rx_udp_eth_src_mac),
    .m_udp_eth_type(rx_udp_eth_type),
    .m_udp_ip_version(rx_udp_ip_version),
    .m_udp_ip_ihl(rx_udp_ip_ihl),
    .m_udp_ip_dscp(rx_udp_ip_dscp),
    .m_udp_ip_ecn(rx_udp_ip_ecn),
    .m_udp_ip_length(rx_udp_ip_length),
    .m_udp_ip_identification(rx_udp_ip_identification),
    .m_udp_ip_flags(rx_udp_ip_flags),
    .m_udp_ip_fragment_offset(rx_udp_ip_fragment_offset),
    .m_udp_ip_ttl(rx_udp_ip_ttl),
    .m_udp_ip_protocol(rx_udp_ip_protocol),
    .m_udp_ip_header_checksum(rx_udp_ip_header_checksum),
    .m_udp_ip_source_ip(rx_udp_ip_source_ip),
    .m_udp_ip_dest_ip(rx_udp_ip_dest_ip),
    .m_udp_source_port(rx_udp_source_port),
    .m_udp_dest_port(rx_udp_dest_port),
    .m_udp_length(rx_udp_length),
    .m_udp_checksum(rx_udp_checksum),
    .m_udp_payload_axis_tdata(rx_udp_payload_axis_tdata),
    .m_udp_payload_axis_tvalid(rx_udp_payload_axis_tvalid),
    .m_udp_payload_axis_tready(rx_udp_payload_axis_tready),
    .m_udp_payload_axis_tlast(rx_udp_payload_axis_tlast),
    .m_udp_payload_axis_tuser(rx_udp_payload_axis_tuser),
    // Status signals
    .ip_rx_busy(),
    .ip_tx_busy(),
    .udp_rx_busy(),
    .udp_tx_busy(),
    .ip_rx_error_header_early_termination(),
    .ip_rx_error_payload_early_termination(),
    .ip_rx_error_invalid_header(),
    .ip_rx_error_invalid_checksum(),
    .ip_tx_error_payload_early_termination(),
    .ip_tx_error_arp_failed(),
    .udp_rx_error_header_early_termination(),
    .udp_rx_error_payload_early_termination(),
    .udp_tx_error_payload_early_termination(),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_arp_cache(0)
);

reg down_frame_reg = 1'b0, down_frame_next;
reg down_enable_reg = 1'b0, down_enable_next;

reg up_frame_reg = 1'b0, up_frame_next;

// internal datapath
reg [7:0] down_xfcp_out_tdata_int;
reg       down_xfcp_out_tvalid_int;
reg       down_xfcp_out_tready_int_reg = 1'b0;
reg       down_xfcp_out_tlast_int;
reg       down_xfcp_out_tuser_int;
wire      down_xfcp_out_tready_int_early;

// downstream logic
always @* begin
    rx_udp_hdr_ready_next = 1'b0;
    rx_udp_payload_axis_tready_next = 1'b0;

    down_frame_next = down_frame_reg;
    down_enable_next = down_enable_reg;

    tx_udp_dest_port_next = tx_udp_dest_port_reg;
    tx_udp_ip_dest_ip_next = tx_udp_ip_dest_ip_reg;

    if (rx_udp_payload_axis_tready && rx_udp_payload_axis_tvalid) begin
        if (rx_udp_payload_axis_tlast) begin
            down_frame_next = 1'b0;
        end
    end

    down_xfcp_out_tdata_int = rx_udp_payload_axis_tdata;
    down_xfcp_out_tvalid_int = 1'b0;
    down_xfcp_out_tlast_int = rx_udp_payload_axis_tlast;
    down_xfcp_out_tuser_int = rx_udp_payload_axis_tuser;

    if (down_frame_reg) begin
        rx_udp_payload_axis_tready_next = down_xfcp_out_tready_int_early;
        down_xfcp_out_tvalid_int = rx_udp_payload_axis_tvalid && down_enable_reg;
    end else begin
        rx_udp_hdr_ready_next = 1'b1;
        if (rx_udp_hdr_ready && rx_udp_hdr_valid) begin
            rx_udp_hdr_ready_next = 1'b0;
            rx_udp_payload_axis_tready_next = down_xfcp_out_tready_int_early;
            down_frame_next = 1'b1;
            if (rx_udp_dest_port == local_port) begin
                down_enable_next = 1'b1;
                tx_udp_dest_port_next = rx_udp_source_port;
                tx_udp_ip_dest_ip_next = rx_udp_ip_source_ip;
            end else begin
                down_enable_next = 1'b0;
            end
        end
    end
end

// upstream logic
always @* begin
    tx_udp_hdr_valid_next = tx_udp_hdr_valid_reg && !tx_udp_hdr_ready;

    up_frame_next = up_frame_reg;

    if (down_xfcp_in_tready && down_xfcp_in_tvalid) begin
        if (down_xfcp_in_tlast) begin
            up_frame_next = 1'b0;
        end
    end

    if (!up_frame_reg && down_xfcp_in_tvalid) begin
        up_frame_next = 1'b1;
        tx_udp_hdr_valid_next = 1'b1;
    end
end

always @(posedge clk) begin
    down_frame_reg <= down_frame_next;
    down_enable_reg <= down_enable_next;

    up_frame_reg <= up_frame_next;

    rx_udp_hdr_ready_reg <= rx_udp_hdr_ready_next;
    rx_udp_payload_axis_tready_reg <= rx_udp_payload_axis_tready_next;

    tx_udp_hdr_valid_reg <= tx_udp_hdr_valid_next;
    tx_udp_ip_dest_ip_reg <= tx_udp_ip_dest_ip_next;
    tx_udp_dest_port_reg <= tx_udp_dest_port_next;

    if (rst) begin
        down_frame_reg <= 1'b0;
        down_enable_reg <= 1'b0;
        up_frame_reg <= 1'b0;
        rx_udp_hdr_ready_reg <= 1'b0;
        rx_udp_payload_axis_tready_reg <= 1'b0;
        tx_udp_hdr_valid_reg <= 1'b0;
    end
end

// downstream output datapath logic
reg [7:0]  down_xfcp_out_tdata_reg = 8'd0;
reg        down_xfcp_out_tvalid_reg = 1'b0, down_xfcp_out_tvalid_next;
reg        down_xfcp_out_tlast_reg = 1'b0;
reg        down_xfcp_out_tuser_reg = 1'b0;

reg [7:0]  temp_down_xfcp_tdata_reg = 8'd0;
reg        temp_down_xfcp_tvalid_reg = 1'b0, temp_down_xfcp_tvalid_next;
reg        temp_down_xfcp_tlast_reg = 1'b0;
reg        temp_down_xfcp_tuser_reg = 1'b0;

// datapath control
reg store_down_xfcp_int_to_output;
reg store_down_xfcp_int_to_temp;
reg store_down_xfcp_temp_to_output;

assign down_xfcp_out_tdata = down_xfcp_out_tdata_reg;
assign down_xfcp_out_tvalid = down_xfcp_out_tvalid_reg;
assign down_xfcp_out_tlast = down_xfcp_out_tlast_reg;
assign down_xfcp_out_tuser = down_xfcp_out_tuser_reg;

// enable ready input next cycle if output is ready or the temp reg will not be filled on the next cycle (output reg empty or no input)
assign down_xfcp_out_tready_int_early = down_xfcp_out_tready || (!temp_down_xfcp_tvalid_reg && (!down_xfcp_out_tvalid_reg || !down_xfcp_out_tvalid_int));

always @* begin
    // transfer sink ready state to source
    down_xfcp_out_tvalid_next = down_xfcp_out_tvalid_reg;
    temp_down_xfcp_tvalid_next = temp_down_xfcp_tvalid_reg;

    store_down_xfcp_int_to_output = 1'b0;
    store_down_xfcp_int_to_temp = 1'b0;
    store_down_xfcp_temp_to_output = 1'b0;

    if (down_xfcp_out_tready_int_reg) begin
        // input is ready
        if (down_xfcp_out_tready || !down_xfcp_out_tvalid_reg) begin
            // output is ready or currently not valid, transfer data to output
            down_xfcp_out_tvalid_next = down_xfcp_out_tvalid_int;
            store_down_xfcp_int_to_output = 1'b1;
        end else begin
            // output is not ready, store input in temp
            temp_down_xfcp_tvalid_next = down_xfcp_out_tvalid_int;
            store_down_xfcp_int_to_temp = 1'b1;
        end
    end else if (down_xfcp_out_tready) begin
        // input is not ready, but output is ready
        down_xfcp_out_tvalid_next = temp_down_xfcp_tvalid_reg;
        temp_down_xfcp_tvalid_next = 1'b0;
        store_down_xfcp_temp_to_output = 1'b1;
    end
end

always @(posedge clk) begin
    if (rst) begin
        down_xfcp_out_tvalid_reg <= 1'b0;
        down_xfcp_out_tready_int_reg <= 1'b0;
        temp_down_xfcp_tvalid_reg <= 1'b0;
    end else begin
        down_xfcp_out_tvalid_reg <= down_xfcp_out_tvalid_next;
        down_xfcp_out_tready_int_reg <= down_xfcp_out_tready_int_early;
        temp_down_xfcp_tvalid_reg <= temp_down_xfcp_tvalid_next;
    end

    // datapath
    if (store_down_xfcp_int_to_output) begin
        down_xfcp_out_tdata_reg <= down_xfcp_out_tdata_int;
        down_xfcp_out_tlast_reg <= down_xfcp_out_tlast_int;
        down_xfcp_out_tuser_reg <= down_xfcp_out_tuser_int;
    end else if (store_down_xfcp_temp_to_output) begin
        down_xfcp_out_tdata_reg <= temp_down_xfcp_tdata_reg;
        down_xfcp_out_tlast_reg <= temp_down_xfcp_tlast_reg;
        down_xfcp_out_tuser_reg <= temp_down_xfcp_tuser_reg;
    end

    if (store_down_xfcp_int_to_temp) begin
        temp_down_xfcp_tdata_reg <= down_xfcp_out_tdata_int;
        temp_down_xfcp_tlast_reg <= down_xfcp_out_tlast_int;
        temp_down_xfcp_tuser_reg <= down_xfcp_out_tuser_int;
    end
end

endmodule
