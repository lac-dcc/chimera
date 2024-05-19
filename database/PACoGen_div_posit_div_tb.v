// This program was cloned from: https://github.com/manish-kj/PACoGen
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
module posit_div_tb_v;

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N=32;
parameter Bs=log2(N);
parameter es=5;
parameter NR_Iter = 2;		// 2 for 32 bits, 1 for 16 bits, 0 for 8bits

reg [N-1:0] in1, in2;
reg start; 
wire [N-1:0] out;
wire done;

	reg clk;
	reg [63:0] data [1:5000000];
	integer i,j,outfile;


// Instantiate the Unit Under Test (UUT)
posit_div #(.N(N), .es(es), .NR_Iter(NR_Iter)) uut (in1, in2, start, out, inf, zero, done);

	
initial $readmemh("input32bit.txt",data);

reg [63:0] A, B;
	
	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		clk = 0;
		start = 0;
	
		
		// Wait 100 ns for global reset to finish
		#100 i=0;j=0; 
		#20 start = 1;
                A={{64-N{1'b0}},{N{1'b1}}}; B={{64-N{1'b0}},{N{1'b1}}};

                #50000910 start = 0;
		#100;
		
		$fclose(outfile);
		$finish;
	end
	
 always #5 clk=~clk;

  always @(posedge clk) begin			
 	in1={data[i]} & A;	
	in2={data[j]} & B;
	//if(i>=2000090)begin
	if(i>=100)begin
  	      $finish;
	end
	else begin
		i=i+1;
		j=i+15;
	end
 end

reg [N-1:0] result [1:5000000];
//initial $readmemh("Pout_16bit_ES3.txt",result);
//initial $readmemh("Pout_32bit_ES1.txt",result);
initial $readmemh("Pout_32bit_ES5.txt",result);

initial outfile = $fopen("error_div.txt", "wb");

reg [N-1:0] diff, tmp_result;
always @(negedge clk) begin
	if(start)begin
	tmp_result = result[i-1];
     	diff = (tmp_result > out) ? tmp_result-out : out-tmp_result;
     	$fwrite(outfile, "%d\n",diff);
     	end
end

endmodule

