// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Ofm_1(clk,rst, address, wrData, wren, readData);
	input clk;
	input rst;
	input[7:0] address;
	input[7:0] wrData;
	input wren;
  output [31:0] readData;
	// new
	// input readen;

	reg [7:0] mem[0:127][0:3];

	  initial
  begin
    $readmemh("file/filter1_L2.txt", mem);
  end

	integer i, j;
	always@(posedge clk, posedge rst)
	begin
		if(rst)begin   
			for (i = 0; i < 44; i = i + 1)
          		for (j = 0; j < 8; j = j + 1)
            		mem[i][j] <= 8'h00;
		end
		else if(wren)
		begin
			mem[address / 4][address % 4] <= wrData;
		end
	end

  
  always @(*)
  begin
    if (wren == 1'b0)
    begin 
      readData[7:0] <= mem[address][0];
      readData[15:8] <= mem[address][1];
      readData[23:16] <= mem[address][2];
      readData[31:24] <= mem[address][3];
    end
  end

endmodule

module Ofm_2(clk,rst, address, wrData, wren, readData);
	input clk;
	input rst;
	input[7:0] address;
	input[7:0] wrData;
	input wren;
  output [31:0] readData;
	// new
	// input readen;

	reg [7:0] mem[0:127][0:3];

	  initial
  begin
    $readmemh("file/filter2_L2.txt", mem);
  end

	integer i, j;
	always@(posedge clk, posedge rst)
	begin
		if(rst)begin   
			for (i = 0; i < 44; i = i + 1)
          		for (j = 0; j < 8; j = j + 1)
            		mem[i][j] <= 8'h00;
		end
		else if(wren)
		begin
			mem[address / 4][address % 4] <= wrData;
		end
	end

  
  always @(*)
  begin
    if (wren == 1'b0)
    begin 
      readData[7:0] <= mem[address][0];
      readData[15:8] <= mem[address][1];
      readData[23:16] <= mem[address][2];
      readData[31:24] <= mem[address][3];
    end
  end

endmodule

module Ofm_3(clk,rst, address, wrData, wren, readData);
	input clk;
	input rst;
	input[7:0] address;
	input[7:0] wrData;
	input wren;
  output [31:0] readData;
	// new
	// input readen;

	reg [7:0] mem[0:127][0:3];

	  initial
  begin
    $readmemh("file/filter3_L2.txt", mem);
  end

	integer i, j;
	always@(posedge clk, posedge rst)
	begin
		if(rst)begin   
			for (i = 0; i < 44; i = i + 1)
          		for (j = 0; j < 8; j = j + 1)
            		mem[i][j] <= 8'h00;
		end
		else if(wren)
		begin
			mem[address / 4][address % 4] <= wrData;
		end
	end

  
  always @(*)
  begin
    if (wren == 1'b0)
    begin 
      readData[7:0] <= mem[address][0];
      readData[15:8] <= mem[address][1];
      readData[23:16] <= mem[address][2];
      readData[31:24] <= mem[address][3];
    end
  end

endmodule

module Ofm_4(clk,rst, address, wrData, wren, readData);
	input clk;
	input rst;
	input[7:0] address;
	input[7:0] wrData;
	input wren;
  output [31:0] readData;
	// new
	// input readen;

	reg [7:0] mem[0:127][0:3];

	  initial
  begin
    $readmemh("file/filter4_L2.txt", mem);
  end

	integer i, j;
	always@(posedge clk, posedge rst)
	begin
		if(rst)begin   
			for (i = 0; i < 44; i = i + 1)
          		for (j = 0; j < 8; j = j + 1)
            		mem[i][j] <= 8'h00;
		end
		else if(wren)
		begin
			mem[address / 4][address % 4] <= wrData;
		end
	end

  
  always @(*)
  begin
    if (wren == 1'b0)
    begin 
      readData[7:0] <= mem[address][0];
      readData[15:8] <= mem[address][1];
      readData[23:16] <= mem[address][2];
      readData[31:24] <= mem[address][3];
    end
  end

endmodule





