// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module DataPath #(parameter N)(
    input clk, rst,
    input wEnBuff, w_r_EnMem , writeEnwindow, readEnmac, addEn, winRst,wrofm, //new
    input [5:0] filterCount, macCount,
    input [9:0] memAddress,
    input [5:0] buffAddress,
    input [7:0] ofmaddr, //new
    input [N-1:0] wEnFilter,
    output [31:0]  Dataofm1,Dataofm2,Dataofm3,Dataofm4 //new
); 

wire [7:0]  windowOut;
wire [7:0] buffOut [0:3];
wire [31:0] memOut;

wire [7:0] macout;


memory mem (
   .clk(clk),
   .rst(rst),
   .w_r_en(w_r_EnMem),
   .memAdr(memAddress),
  //  .writeData(macout),
   .readData(memOut)
);

main_buff main_buffer (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(memOut),
  .buff_out(buffOut)
);

shift_buffer pic_buff (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut),
  .sb_out(windowOut)
);

  generate
		genvar i;
		for (i = 0; i < N; i = i + 1) begin : generating_pe
			PE pes(
        .clk(clk),
        .rst(rst),
        .winRst(winRst),
        .wEnFilter(wEnFilter[i]),
        .readEnmac(readEnmac),
        .w_r_EnMem(w_r_EnMem),
        .addEn(addEn),
        .wrofm(wrofm),
        .filterCount(filterCount),
        .macCount(macCount),
        .memOut(memOut),
        .windowOut(windowOut),
        .macout(macout)
        );
		end
	endgenerate

  Ofm_1 ofm1(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout),
    .wren(wrofm),
    .readData(Dataofm1)
  );

  Ofm_2 ofm2(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout),
    .wren(wrofm),
    .readData(Dataofm2)
  );

  Ofm_3 ofm3(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout),
    .wren(wrofm),
    .readData(Dataofm3)
  );

  Ofm_4 ofm4(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout),
    .wren(wrofm),
    .readData(Dataofm4)
  );


endmodule



