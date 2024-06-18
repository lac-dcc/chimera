// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

`timescale 1ns/100ps


`define cycle_period 10
`define End_CYCLE  1000
`define SET_N 10

module test_tpu;

localparam DATA_WIDTH = 8;
localparam OUT_DATA_WIDTH = 16;
localparam SRAM_DATA_WIDTH = 32;
localparam WEIGHT_NUM = 25, WEIGHT_WIDTH = 4;
localparam ARRAY_SIZE = 8;

//====== module I/O =====
// reg clk;
// reg srstn;
// reg tpu_start;

// wire tpu_finish;

reg clock, reset;

reg input_start;
reg input_valid, output_ready;
wire input_ready, output_valid;
// reg input_finish;


// wire sram_write_enable_a0;
// wire sram_write_enable_a1;


// wire sram_write_enable_b0;
// wire sram_write_enable_b1;


// wire sram_write_enable_c0;
// wire sram_write_enable_c1;
// wire sram_write_enable_c2;

reg [SRAM_DATA_WIDTH-1:0] sram_rdata_a0;
reg [SRAM_DATA_WIDTH-1:0] sram_rdata_a1;

reg [SRAM_DATA_WIDTH-1:0] sram_rdata_b0;
reg [SRAM_DATA_WIDTH-1:0] sram_rdata_b1;


reg [9:0] sram_raddr;
reg [9:0] sram_num;
// reg [9:0] sram_raddr_a1;


// reg [9:0] sram_raddr_b0;
// reg [9:0] sram_raddr_b1;


// wire [5:0] sram_raddr_c0;
// wire [5:0] sram_raddr_c1;
// wire [5:0] sram_raddr_c2;

// wire [3:0] sram_bytemask_a;
// wire [3:0] sram_bytemask_b;
// wire [9:0] sram_waddr_a;
// wire [9:0] sram_waddr_b;
// wire [7:0] sram_wdata_a;
// wire [7:0] sram_wdata_b;

// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c00;
// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c01;
// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c10;
// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c11;
// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c20;
// wire [DATA_WIDTH*OUT_DATA_WIDTH/2-1:0] sram_wdata_c21;

// wire [DATA_WIDTH*OUT_DATA_WIDTH-1:0] sram_rdata_c0;
// wire [DATA_WIDTH*OUT_DATA_WIDTH-1:0] sram_rdata_c1;
// wire [DATA_WIDTH*OUT_DATA_WIDTH-1:0] sram_rdata_c2;

// wire [5:0] sram_waddr_c0;
// wire [5:0] sram_waddr_c1;
// wire [5:0] sram_waddr_c2;

wire [4*OUT_DATA_WIDTH-1:0] c00;
wire [4*OUT_DATA_WIDTH-1:0] c01;
wire [4*OUT_DATA_WIDTH-1:0] c10;
wire [4*OUT_DATA_WIDTH-1:0] c11;
wire [4*OUT_DATA_WIDTH-1:0] c20;
wire [4*OUT_DATA_WIDTH-1:0] c21;
wire [4*OUT_DATA_WIDTH-1:0] c30;
wire [4*OUT_DATA_WIDTH-1:0] c31;
wire [4*OUT_DATA_WIDTH-1:0] c40;
wire [4*OUT_DATA_WIDTH-1:0] c41;
wire [4*OUT_DATA_WIDTH-1:0] c50;
wire [4*OUT_DATA_WIDTH-1:0] c51;
wire [4*OUT_DATA_WIDTH-1:0] c60;
wire [4*OUT_DATA_WIDTH-1:0] c61;
wire [4*OUT_DATA_WIDTH-1:0] c70;
wire [4*OUT_DATA_WIDTH-1:0] c71;

wire signed [7:0] out;


//reg [7:0] mem[0:32*32-1];


//====== top connection =====



//sram connection

MMMMIOBlackBox my(
	.clock(clock),
	.reset(reset),
	.input_start(input_start),
    .input_ready(input_ready),    
	.input_valid(input_valid),
    .output_ready(output_ready),
    .output_valid(output_valid),

	//input data
	.sram_rdata_a0(sram_rdata_a0),
	.sram_rdata_a1(sram_rdata_a1),

	.sram_rdata_b0(sram_rdata_b0),
	.sram_rdata_b1(sram_rdata_b1),

	//input addr
	.sram_raddr(sram_raddr),
	.sram_num(sram_num),

	.c00(c00),
	.c01(c01),
	.c10(c10),
	.c11(c11),
	.c20(c20),
	.c21(c21),
	.c30(c30),
	.c31(c31),
	.c40(c40),
	.c41(c41),
	.c50(c50),
	.c51(c51),
	.c60(c60),
	.c61(c61),
	.c70(c70),
	.c71(c71)
);

//dump wave file
initial begin
  $dumpfile("tpu.vcd"); // "gray.fsdb" can be replaced into any name you want
  $dumpvars(0,test_tpu);              // but make sure in .fsdb format
end

//====== clock generation =====
initial begin
    reset = 1'b1;
    clock = 1'b1;
end

always begin #(`cycle_period/2) clock = ~clock; end
//====== main procedural block for simulation =====
integer cycle_cnt;


integer i,j,k,z;
reg [ARRAY_SIZE*DATA_WIDTH-1:0] mat1[0:ARRAY_SIZE*3-1];
reg [ARRAY_SIZE*DATA_WIDTH-1:0] mat2[0:ARRAY_SIZE*3-1];
reg [ARRAY_SIZE*3*DATA_WIDTH-1:0] tmp_c_mat1[0:ARRAY_SIZE-1];
reg [ARRAY_SIZE*3*DATA_WIDTH-1:0] tmp_c_mat2[0:ARRAY_SIZE-1];
reg [(ARRAY_SIZE*3+3)*DATA_WIDTH-1:0] tmp_mat1[0:ARRAY_SIZE-1];
reg [(ARRAY_SIZE*3+3)*DATA_WIDTH-1:0] tmp_mat2[0:ARRAY_SIZE-1];
reg [ARRAY_SIZE*OUT_DATA_WIDTH-1:0] golden1[0:ARRAY_SIZE-1];
reg [ARRAY_SIZE*OUT_DATA_WIDTH-1:0] golden2[0:ARRAY_SIZE-1];
reg [ARRAY_SIZE*OUT_DATA_WIDTH-1:0] golden3[0:ARRAY_SIZE-1];

reg [ARRAY_SIZE*16-1:0] trans_golden1[0:(ARRAY_SIZE*2-1)-1];
reg [ARRAY_SIZE*16-1:0] trans_golden2[0:(ARRAY_SIZE*2-1)-1];
reg [ARRAY_SIZE*16-1:0] trans_golden3[0:(ARRAY_SIZE*2-1)-1];

reg [31:0] a0 [0:26];
reg [31:0] a1 [0:26];
reg [31:0] b0 [0:26];
reg [31:0] b1 [0:26];



initial begin
	#(`End_CYCLE*`cycle_period);
	$display("-----------------------------------------------------\n");
	$display("Error!!! There is something wrong with your code ...!\n");
 	$display("------The test result is .....FAIL ------------------\n");
 	$display("-----------------------------------------------------\n");
 	$finish;
end

initial begin
a0[0]= 32'b00000001000000000000000000000000;
a0[1]= 32'b00000000000000000000000000000000;
a0[2]= 32'b00000000000000010000000000000000;
a0[3]= 32'b00000000000000000000000000000000;
a0[4]= 32'b00000000000000000000000100000000;
a0[5]= 32'b00000000000000000000000000000000;
a0[6]= 32'b00000000000000000000000000000001;
a0[7]= 32'b00000000000000000000000000000000;
a0[8]= 32'b00000000000000000000000000000000;
a0[9]= 32'b00000000000000000000000000000000;
a0[10]=32'b00000000000000000000000000000000;

a1[0]= 32'b00000000000000000000000000000000;
a1[1]= 32'b00000000000000000000000000000000;
a1[2]= 32'b00000000000000000000000000000000;
a1[3]= 32'b00000000000000000000000000000000;
a1[4]= 32'b00000001000000000000000000000000;
a1[5]= 32'b00000000000000000000000000000000;
a1[6]= 32'b00000000000000010000000000000000;
a1[7]= 32'b00000000000000000000000000000000;
a1[8]= 32'b00000000000000000000000100000000;
a1[9]= 32'b00000000000000000000000000000000;
a1[10]=32'b00000000000000000000000000000001;

b0[0]=32'b01100011000000000000000000000000;
b0[1]=32'b11010000101000110000000000000000;
b0[2]=32'b01001101011110110111010100000000;
b0[3]=32'b11000100101001110010000100001000;
b0[4]=32'b01101101000011110001110001011111;
b0[5]=32'b10011011000101101000100010001111;
b0[6]=32'b00100101000011011010111010110001;
b0[7]=32'b01100110101111110100001001100100;
b0[8]=32'b11000110101101010011010100110000;
b0[9]=32'b10101111001001001100001110001111;
b0[10]=32'b10101110001101010000011110010000;

b1[0]=32'b01101000000000000000000000000000;
b1[1]=32'b01111101001011100000000000000000;
b1[2]=32'b10000110100100011101011100000000;
b1[3]=32'b01011001000101110101111001101010;
b1[4]=32'b10111110100100110001001111111101;
b1[5]=32'b00001100011010000001010001101101;
b1[6]=32'b01110110011000010001000100111101;
b1[7]=32'b10010101111011010101110100000101;
b1[8]=32'b11110001000011110110101111000101;
b1[9]=32'b01100110110111000111011001110111;
b1[10]=32'b11101111011001001001101101000100;
end

initial begin
    $readmemb("mat1.txt", mat1);
    $readmemb("mat2.txt", mat2);
    $readmemb("golden1.txt",golden1);
    $readmemb("golden2.txt",golden2);
    $readmemb("golden3.txt",golden3);

    #(`cycle_period);


	cycle_cnt = 0;
	#(`cycle_period/2) 
	reset = 0;
	input_start = 1;
	output_ready = 1;
	input_valid = 0;
	#(`cycle_period)
	z=0;
	k=0;
	while(z<`SET_N)begin  
		@(negedge clock);     begin
			sram_num = z;
		end
		while(k<11)begin  			
			@(negedge clock);     begin
				sram_raddr = k;
				sram_rdata_a0 = a0[k];
				sram_rdata_a1 = a1[k];
				sram_rdata_b0 = b0[k];
				sram_rdata_b1 = b1[k];
				k++;
			end			
		end
		k=0;
		z++;
	end
	z=0;

	@(posedge clock);     begin
			input_valid = 1;
		end
		@(posedge clock);     begin
			input_valid = 0;
		end
	while(z<`SET_N-1)begin  
		@(negedge clock);     begin
			cycle_cnt = cycle_cnt + 1;
		end
		if(cycle_cnt%50 == 0) begin
			@(posedge clock);     begin
				input_valid = 1;
			end
			@(posedge clock);     begin
				input_valid = 0;
			end
			z++;
		end
		
	end

	while(my.state!=2'b10)begin    //it's mean that your sram c0, c1, c2 can be tested
		@(negedge clock);     begin
			cycle_cnt = cycle_cnt + 1;
		end
	end

	wout;//task
	$write("\n\n");
	wout2;//task
      
    $display("Total cycle count C after three matrix evaluation = %d.", cycle_cnt);
    #5 $finish;
end

task wout;
integer this_i, this_j, this_k;
	for(this_k=0; this_k<15;this_k = this_k +1)begin	  
		for(this_i=ARRAY_SIZE;this_i>0;this_i=this_i-1) begin
            		$write("%d ", $signed(my.mem_c0[this_k][(this_i*OUT_DATA_WIDTH-1) -: OUT_DATA_WIDTH]));
        	end
		$write("\n\n");
	end

endtask
task wout2;
integer this_i, this_j, this_k;
	for(this_k=0; this_k<8;this_k = this_k +1)begin	  
		for(this_i=ARRAY_SIZE;this_i>0;this_i=this_i-1) begin
            		$write("%h ", $signed(golden1[this_k][(this_i*OUT_DATA_WIDTH-1) -: OUT_DATA_WIDTH]));
        	end
		$write("\n\n");
	end
endtask
endmodule


// initial begin
// a0[0]=32'b10101111000000000000000000000000;
// a0[1]=32'b10011110111111110000000000000000;
// a0[2]=32'b01101110010100011111101000000000;
// a0[3]=32'b10011111101101001100101111010010;
// a0[4]=32'b00001110111000000100000010101011;
// a0[5]=32'b11111001010010000001011111111101;
// a0[6]=32'b10111111110100010010101111110000;
// a0[7]=32'b10111001110000100001101111100111;
// a0[8]=32'b10001001000000011001100111001111;
// a0[9]=32'b10110101111001100111001010101111;
// a0[10]=32'b10110011101110011001011111111101;
// a0[11]=32'b01101100101111010000011011010001;
// a0[12]=32'b10001001001110001100000101110100;
// a0[13]=32'b00011100111110011010110111111111;
// a0[14]=32'b10100010110001111000000101100101;
// a0[15]=32'b11100110011100000100011010110100;
// a0[16]=32'b00101100011110101011100000010011;
// a0[17]=32'b00100010010100110010111000100010;
// a0[18]=32'b10011010100010010110100111111110;
// a0[19]=32'b00011011101100101101100000010011;
// a0[20]=32'b11000010000101100111001111101100;
// a0[21]=32'b00011011001000010010001001111110;
// a0[22]=32'b00100110011010000010100110010001;
// a0[23]=32'b11110001100100010110001101100101;
// a0[24]=32'b00000000111101011001110000000001;
// a0[25]=32'b00000000000000000000000000110111;
// a0[26]=32'b00000000000000000000000011010101;

// a1[0]=32'b10001011000000000000000000000000;
// a1[1]=32'b11100111001101110000000000000000;
// a1[2]=32'b00110011011110001111001000000000;
// a1[3]=32'b01111011011100111001001100000110;
// a1[4]=32'b00111010101011101010010011111011;
// a1[5]=32'b01100111000011011110010100000000;
// a1[6]=32'b01000110110000101100100010110001;
// a1[7]=32'b10100101000001111010111111011110;
// a1[8]=32'b01111010001001000110001111110001;
// a1[9]=32'b11010001100000000000010100010100;
// a1[10]=32'b11011010111110000111011011110010;
// a1[11]=32'b11011111010000000100010101000100;
// a1[12]=32'b00010101010110000110000110010110;
// a1[13]=32'b11101001010111111011001101100100;
// a1[14]=32'b10110100000000011001011000100010;
// a1[15]=32'b10010111011110110100100001011100;
// a1[16]=32'b00111100011101001010001001100011;
// a1[17]=32'b01011100001111011000100111110001;
// a1[18]=32'b10110011101010110011101110010110;
// a1[19]=32'b10101011011101010100010001110100;
// a1[20]=32'b00110000111011000001111101010111;
// a1[21]=32'b11101111011100000100100000011011;
// a1[22]=32'b11100101000000110011111010000000;
// a1[23]=32'b00010100110010100011111000010100;
// a1[24]=32'b00000000111010101111011111111111;
// a1[25]=32'b00000000000000001110000101101011;
// a1[26]=32'b00000000000000000000000001101100;

// b0[0]=32'b01100011000000000000000000000000;
// b0[1]=32'b11010000101000110000000000000000;
// b0[2]=32'b01001101011110110111010100000000;
// b0[3]=32'b11000100101001110010000100001000;
// b0[4]=32'b01101101000011110001110001011111;
// b0[5]=32'b10011011000101101000100010001111;
// b0[6]=32'b00100101000011011010111010110001;
// b0[7]=32'b01100110101111110100001001100100;
// b0[8]=32'b11000110101101010011010100110000;
// b0[9]=32'b10101111001001001100001110001111;
// b0[10]=32'b10101110001101010000011110010000;
// b0[11]=32'b11111011010101000100100111001011;
// b0[12]=32'b10001101101111100001100101111011;
// b0[13]=32'b11111100010111011001011001001100;
// b0[14]=32'b00100011010011011101010111010101;
// b0[15]=32'b10111001111110001011111111000110;
// b0[16]=32'b00011100111011101100000111100000;
// b0[17]=32'b11111111000010100011101101001001;
// b0[18]=32'b00100101011000001010010011110010;
// b0[19]=32'b10111111100110101101011100101100;
// b0[20]=32'b10101100010111000001001001110101;
// b0[21]=32'b10001001100000000011010011111110;
// b0[22]=32'b00011000100010101001000000110100;
// b0[23]=32'b00111001010111000100010001011001;
// b0[24]=32'b00000000101111101101000100100101;
// b0[25]=32'b00000000000000000110011101001001;
// b0[26]=32'b00000000000000000000000011001001;

// b1[0]=32'b01101000000000000000000000000000;
// b1[1]=32'b01111101001011100000000000000000;
// b1[2]=32'b10000110100100011101011100000000;
// b1[3]=32'b01011001000101110101111001101010;
// b1[4]=32'b10111110100100110001001111111101;
// b1[5]=32'b00001100011010000001010001101101;
// b1[6]=32'b01110110011000010001000100111101;
// b1[7]=32'b10010101111011010101110100000101;
// b1[8]=32'b11110001000011110110101111000101;
// b1[9]=32'b01100110110111000111011001110111;
// b1[10]=32'b11101111011001001001101101000100;
// b1[11]=32'b00001110100010011110000010000100;
// b1[12]=32'b10011100101000100110011110011000;
// b1[13]=32'b10110101101100111011000110101001;
// b1[14]=32'b01101111110111001111101100001010;
// b1[15]=32'b11110010111011110110101100011111;
// b1[16]=32'b10110000011000101010011000101010;
// b1[17]=32'b11100101101101110001010110001100;
// b1[18]=32'b11010001011101110100010000110011;
// b1[19]=32'b11110001110000010101101010111010;
// b1[20]=32'b11011111110110101011110001010110;
// b1[21]=32'b11010011010000101010100000001110;
// b1[22]=32'b11011011011101010101101000010110;
// b1[23]=32'b00000100110110100011101000000001;
// b1[24]=32'b00000000111010111100101010000000;
// b1[25]=32'b00000000000000000111000011000100;
// b1[26]=32'b00000000000000000000000001111100;
// end