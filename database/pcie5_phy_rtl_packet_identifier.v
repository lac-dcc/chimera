module packet_identifier #(
    parameter GEN1_PIPEWIDTH = 8 ,	
	parameter GEN2_PIPEWIDTH = 8 ,	

	parameter GEN3_PIPEWIDTH = 8 ,	

								
	parameter GEN4_PIPEWIDTH = 8 ,	
	parameter GEN5_PIPEWIDTH =8
)(

input [511:0]data_in,
input [63:0]DK,
input valid_pd,
input [2:0]gen,
input linkup,
input clk,
input rst,
input [4:0]numberOfDetectedLanes,
// gen 3
input [31:0]syncHeader,


output [511:0] data_out,

output [63:0]pl_valid,
output [63:0]pl_dlpstart,
output [63:0]pl_dlpend,
output [63:0]pl_tlpstart,
output [63:0]pl_tlpedb,
output [63:0]pl_tlpend,

output w

);
wire hld;
wire sel;
wire [63:0]valid;
wire [511:0]data;
wire [511:0]data_sel1;
wire [511:0]data_sel2;
wire [383:0] bytetype_sel1;
wire [63:0]DK_in;
wire [383:0] bytetype_sel2;



Gen1_2_DataPath gen1_2_db(
    .Data_in(data_in),
    .DK(DK),
    .valid(valid),
    .Data_out(data_sel1),
    .clk(clk),
    .dlpstart   (bytetype_sel1[63:0]    ),
    .dlpend     (bytetype_sel1[127:64]  ),
    .tlpstart   (bytetype_sel1[191:128]  ),
    .tlpedb     (bytetype_sel1[255:192] ),
.tlpend         (bytetype_sel1[319:256]  ),
    .valid_d    (bytetype_sel1[383:320  ])
);

Gen3_DataPath gen3_db(
    .Data_in(data_in),
    .syncHeader(syncHeader),
    .valid(valid),
    .clk(clk),
    .Data_out(data_sel2),
    .dlpstart (bytetype_sel2[63:0]   ),
    .dlpend   (bytetype_sel2[127:64] ),
    .tlpstart (bytetype_sel2[191:128]),
    .tlpedb   (bytetype_sel2[255:192]),
    .tlpend   (bytetype_sel2[319:256]),
    .valid_d  (bytetype_sel2[383:320])  ,
    .rst(rst)
);

Gen_ctrl #(
     .GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),	
	 .GEN2_PIPEWIDTH(GEN2_PIPEWIDTH),	
	 .GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),								
	 .GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),	
	 .GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)
) gen_ctrl(
    
    .valid_pd(valid_pd),
    .gen(gen),
    .linkup(linkup),
    .numberOfDetectedLanes(numberOfDetectedLanes),
    .sel(sel),
    .valid(valid),
    .w(w)

);



Gen_mux gen_mux(
    .data_in1(data_sel1),
    .data_in2(data_sel2),
    .bytetype1(bytetype_sel1),
    .bytetype2(bytetype_sel2),
    .sel(sel),
    .data_out(data_out),
    .ByteType({pl_valid,pl_tlpend,pl_tlpedb,pl_tlpstart,pl_dlpend,pl_dlpstart})
);

endmodule

