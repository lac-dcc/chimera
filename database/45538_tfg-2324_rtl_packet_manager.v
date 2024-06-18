// This program was cloned from: https://github.com/p-ariza/tfg-2324
// License: MIT License

/*

Copyright (c) 2024 Pablo Ariza García

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

module packet_manager #(
        //Flow characteristics
        parameter ID = 0,
        parameter SIZE=64,
        parameter FREQUENCY = 350000000,
		parameter BANDWIDTH = 1000000000,

        //Packet contents
        parameter PAYLOAD=8'h1A,
		parameter MAC_D=48'hBC9A78563412,
		parameter MAC_S=48'h111111111111,
		parameter ETHERTYPE=16'h0800
	)
	(
		input wire clk,
		input wire rst,

        //Arbitrer communication
        output wire arb_request,
        output wire arb_ack,
        input  wire arb_grant,

        //FIFO communication
        input  wire fifo_wr_ready,
        output wire fifo_wr_enable,

		//Command outputs
		output wire [10:0]  size,
		output wire [47:0]  d_mac,
        output wire [47:0]  s_mac,
        output wire [15:0]  ethertype,
        output wire [7 :0]  payload
	);

    //Endian Conversion for MAC adresses and ETHERTYPE
	localparam [15:0] EC_ETHERTYPE = {ETHERTYPE[7:0], ETHERTYPE[15:8]};
	localparam [47:0] EC_MAC_D = {MAC_D[7:0], MAC_D[15:8], MAC_D[23:16], MAC_D[31:24], MAC_D[39:32], MAC_D[47:40]};
	localparam [47:0] EC_MAC_S = {MAC_S[7:0], MAC_S[15:8], MAC_S[23:16], MAC_S[31:24], MAC_S[39:32], MAC_S[47:40]};

    reg [10:0]	size_reg        = SIZE;
    reg [47:0]	d_mac_reg       = EC_MAC_D;
    reg [47:0]  s_mac_reg       = EC_MAC_S;
    reg [15:0]  ethertype_reg   = EC_ETHERTYPE;
    reg [7 :0]  payload_reg     = PAYLOAD;

    reg request_reg;
    reg ack_reg;
    reg fifo_wr_enable_reg;

    assign size = size_reg;
    assign d_mac = d_mac_reg;
    assign s_mac = s_mac_reg;
    assign ethertype = ethertype_reg;
    assign payload = payload_reg;

    assign arb_request = request_reg;
    assign arb_ack = ack_reg;
    assign fifo_wr_enable = fifo_wr_enable_reg;

    wire counter_out;
    reg  counter_out_reg;

    pm_counter #(
        .SIZE(SIZE),
        .FREQUENCY(FREQUENCY),
        .BANDWIDTH(BANDWIDTH),
        .INTEGRATION_CYCLE(100)
    ) counter (
        .clk(clk),
        .rst(rst),
        .output_sig(counter_out)
    );

    always @(*) begin
        request_reg <= (counter_out_reg || counter_out) && !arb_grant;
        ack_reg <= 1;
    end

    always@(posedge clk) begin
        if (rst) begin
            counter_out_reg <= 0;
        end else if (!counter_out_reg || arb_grant) begin
            counter_out_reg <= counter_out;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            fifo_wr_enable_reg <= 0;
        end else begin
            if (arb_grant && fifo_wr_ready) begin
                //Permission is granted and FIFO is ready
                fifo_wr_enable_reg <= 1;
            end else begin
                fifo_wr_enable_reg <= 0;
            end
        end
    end
    

endmodule