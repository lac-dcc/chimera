`include "timescale.v"
`include "define.v"


module a_tb();

reg clk,reset_n; 
reg [15:0] ai_data;
wire ai_we;

wire ao_next,bo_we_luma,bo_we_chroma,co_lastMB_DF;
wire [19:0] bo_addr_luma;
wire [18:0] bo_addr_chroma;
wire [31:0] bo_data;
wire [15:0] POC;
reg [0:63] mem [0:200000];
reg [0:12600000] BS_buffer;
reg [0:20] i;
reg [31:0] pc_count;
initial begin
  
  $readmemh("test.dat",mem);
  for(i=0;i<21'd200000;i=i+1)
    BS_buffer[64*i +: 64] <= mem[i];
 
end  


initial begin
	clk = 1'b1;
	reset_n = 1'b1;
	
	#100 reset_n = 1'b0;
	#100 reset_n = 1'b1;
	//#3000000000 $stop;
	end



always begin
	#50 clk = ~clk;
       end

always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		pc_count <= 0;
	else if(ao_next)
		pc_count <= pc_count + 1;

always@(pc_count or BS_buffer)
	ai_data = BS_buffer[(pc_count<<4) +: 16];

assign ai_we = 1;


h264i h264i_tb(
	.clk(clk),.reset_n(reset_n),
        .ai_data(ai_data),
        .ai_we(ai_we),
        .ao_next(ao_next),
	.bo_we_luma(bo_we_luma),.bo_we_chroma(bo_we_chroma), 
        .bo_addr_luma(bo_addr_luma),
	.bo_addr_chroma(bo_addr_chroma),
        .bo_data(bo_data),
	.POC(POC),
        .co_lastMB_DF(co_lastMB_DF)          //last mb df for one frame
);

reg [31:0] y [230399:0];
reg [31:0] u [57599:0];
reg [31:0] v [57599:0];

wire [17:0] luma_i;
wire [15:0] chroma_i;

assign luma_i = (bo_addr_luma[10:0]) * 320 + (bo_addr_luma[19:11]);
assign chroma_i = (bo_addr_chroma[9:0]) * 160 + (bo_addr_chroma[17:10]);


/*always@(posedge clk)
	if(bo_we_luma)begin
		if(bo_addr_luma[10:0] < 11'd80 && bo_addr_luma[10:0] > 11'd47 && bo_addr_luma[19:11] < 9'd16 && bo_addr_luma[19:11] > 9'd3)
		y[luma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 0)begin
		if(bo_addr_chroma[9:0] < 9'd40 && bo_addr_chroma[9:0] > 9'd23 && bo_addr_chroma[17:10] < 8'd8 &&  bo_addr_chroma[17:10] > 8'd1 )
		u[chroma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 1)begin
		if(bo_addr_chroma[9:0] < 9'd40 && bo_addr_chroma[9:0] > 9'd23 && bo_addr_chroma[17:10] < 8'd8 &&  bo_addr_chroma[17:10] > 8'd1 )
		v[chroma_i] <= bo_data;end
*/
always@(posedge clk)
	if(bo_we_luma)begin
		y[luma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 0)begin
		u[chroma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 1)begin
		v[chroma_i] <= bo_data;end

wire [7:0] hundred,decade,unit;

assign hundred = POC / 100 + 8'd48;
assign decade = (POC % 100) / 10 + 8'd48;
assign unit = POC % 10 + 8'd48;

integer file;
integer j;
reg [23:0] nn;


always@(co_lastMB_DF or hundred or decade or unit )
	if(co_lastMB_DF )begin
		nn = {hundred,decade,unit};
		file = $fopen(nn,"w");
		for(j=0;j<230400;j=j+1)begin
		$fdisplay (file,"%h", y[j][7:0]);
		$fdisplay (file,"%h", y[j][15:8]);
		$fdisplay (file,"%h", y[j][23:16]);
		$fdisplay (file,"%h", y[j][31:24]);end
		
		for(j=0;j<57600;j=j+1)begin
		$fdisplay (file,"%h", u[j][7:0]);
		$fdisplay (file,"%h", u[j][15:8]);
		$fdisplay (file,"%h", u[j][23:16]);
		$fdisplay (file,"%h", u[j][31:24]);end
		
		for(j=0;j<57600;j=j+1)begin
		$fdisplay (file,"%h", v[j][7:0]);
		$fdisplay (file,"%h", v[j][15:8]);
		$fdisplay (file,"%h", v[j][23:16]);
		$fdisplay (file,"%h", v[j][31:24]);end
		
		$fclose(file);
		end





endmodule
