// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0



/*

wire ramCLK;
wire ramCLKEn;
wire ramWriteEn;
wire [15:0] ramWriteData;
wire [7:0] ramAddr;
wire [15:0] ramReadData;

ebr8x16 ebr (


        .clk_i(ramCLK), 
        .rst_i(reset_in), 
        .clk_en_i(ramCLKEn), 
        .wr_en_i(ramWriteEn), 
        .wr_data_i(ramWriteData), 
        .addr_i(ramAddr), 
        .rd_data_o(ramReadData)
		
*/
module ebr8x16 (
	clk_i,
	rst_i,
	clk_en_i,

	wr_en_i,
	addr_i,
	rd_data_o,
wr_data_i
);


input  clk_i;
input  rst_i;
input  clk_en_i;
input  wr_en_i;
input [7:0] addr_i;
input [15:0] wr_data_i;

output [15:0] rd_data_o;



wire  clk_i;
wire  rst_i;
wire  clk_en_i;
wire  wr_en_i;

wire [7:0] addr_i;

wire [15:0] wr_data_i;
wire [15:0] rd_data_o;

assign rd_data_o = 16'haaaa;


endmodule      
