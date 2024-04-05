`include "timescale.v"
`include "define.v"


module syntax_tb();
  
reg clk,reset_n;  
reg [15:0] BitStream_buffer_output; 
reg [31:0] BitStream_buffer_output_ex32;
wire [31:0] pc;
wire end_of_lastMB_DF;
//wire  final_frame_RAM_wr;
//wire  [20:0] final_frame_RAM_addr;
wire [31:0] final_frame_RAM_din;
reg [8:0] pic_num;
reg [0:63] mem [0:200000];
reg [0:12600000] BS_buffer;
reg [0:20] i;
wire luma_ram_w,chroma_ram_w;
wire [19:0] luma_ram_addr;
wire [18:0] chroma_ram_addr;
wire [15:0] POC;

initial begin
  
  $readmemh("test.dat",mem);
  for(i=0;i<21'd200000;i=i+1)
    BS_buffer[64*i +: 64] <= mem[i];
 
end  
  
always@(posedge clk or negedge reset_n)
		if (reset_n == 1'b0)begin
			BitStream_buffer_output <= 16'b0;
			BitStream_buffer_output_ex32 <= 0;end
		else begin
      		BitStream_buffer_output	<= BS_buffer[pc +: 16]  ;
		BitStream_buffer_output_ex32 <= BS_buffer[(pc+16) +: 32]  ;end

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
always@(POC)
	if(POC == 16'd598)
		$stop;


h264_top tb(
.clk(clk),
.reset_n(reset_n),
.BitStream_buffer_output(BitStream_buffer_output),
.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
.pc(pc),
.end_of_lastMB_DF(end_of_lastMB_DF),
.POC(POC),
/*.final_frame_RAM_wr(final_frame_RAM_wr),
.final_frame_RAM_addr(final_frame_RAM_addr),*/
.final_frame_RAM_din(final_frame_RAM_din),
.luma_ram_w(luma_ram_w),.chroma_ram_w(chroma_ram_w),
.luma_ram_addr(luma_ram_addr),
.chroma_ram_addr(chroma_ram_addr)
);

reg [31:0] y [25343:0];
reg [31:0] u [6335:0];
reg [31:0] v [6335:0];

wire [14:0] luma_i;
wire [12:0] chroma_i;

assign luma_i = luma_ram_addr[8:0] * 88 + luma_ram_addr[18:11];
assign chroma_i = chroma_ram_addr[7:0] * 44 + chroma_ram_addr[17:10];

always@(posedge clk)
	if(luma_ram_w)
		y[luma_i] <= final_frame_RAM_din;
	else if(chroma_ram_w && chroma_ram_addr[18] == 0)
		u[chroma_i] <= final_frame_RAM_din;
	else if(chroma_ram_w && chroma_ram_addr[18] == 1)
		v[chroma_i] <= final_frame_RAM_din;

integer file;
integer j;

reg [23:0] nn;

wire [7:0] hundred,decade,unit;

assign hundred = POC / 100 + 8'd48;
assign decade = (POC % 100) / 10 + 8'd48;
assign unit = POC % 10 + 8'd48;



	



always@(end_of_lastMB_DF or hundred or decade or unit)
	if(end_of_lastMB_DF)begin
		nn = {hundred,decade,unit};
		file = $fopen(nn,"w");
		for(j=0;j<25344;j=j+1)begin
		$fdisplay (file,"%h", y[j][7:0]);
		$fdisplay (file,"%h", y[j][15:8]);
		$fdisplay (file,"%h", y[j][23:16]);
		$fdisplay (file,"%h", y[j][31:24]);end
		
		for(j=0;j<6336;j=j+1)begin
		$fdisplay (file,"%h", u[j][7:0]);
		$fdisplay (file,"%h", u[j][15:8]);
		$fdisplay (file,"%h", u[j][23:16]);
		$fdisplay (file,"%h", u[j][31:24]);end
		
		for(j=0;j<6336;j=j+1)begin
		$fdisplay (file,"%h", v[j][7:0]);
		$fdisplay (file,"%h", v[j][15:8]);
		$fdisplay (file,"%h", v[j][23:16]);
		$fdisplay (file,"%h", v[j][31:24]);end
		
		$fclose(file);
		end


       
endmodule
