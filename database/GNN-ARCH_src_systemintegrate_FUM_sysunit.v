module sysunit(
	clk,
	ena,
	rst,
	// weight input 
	weightvalue,
	weigthvalid,
	weigthend,

	// weight shift 
	weightoutvalue,
	weigthoutvalid,
	weigthoutend,

	//feature  input
	featurevalue,
	featurevalid,
	featureend,

	//feature  shift
	featureoutvalue,
	featureoutvalid,
	featureoutvend,


	// result out
	resultvalid,
	resultvalue
);


parameter WL = 32;
parameter PIPDEP = 5;


input clk, ena, rst;

input [WL-1:0] weightvalue, featurevalue;
input weigthvalid, featurevalid, weigthend, featureend;


// regist for input

reg [WL-1:0] tmpweightvalue, tmpfeaturevalue;
reg tmpweigthvalid, tmpfeaturevalid, tmpweigthend, tmpfeatureend;


// define the output


output reg [WL-1:0] weightoutvalue, featureoutvalue;
output reg weigthoutvalid, weigthoutend, featureoutvalid, featureoutvend;


always @ (posedge clk)
begin
	if(rst) begin
			weightoutvalue <= 0;
			featureoutvalue <= 0;
			weigthoutvalid <= 0;
			weigthoutend <= 0;
			featureoutvalid <= 0;
			featureoutvend <= 0;
	end
	else begin
		if(~ena) begin
			weightoutvalue <= weightoutvalue;
			featureoutvalue <= featureoutvalue;
			weigthoutvalid <= weigthoutvalid;
			weigthoutend <= weigthoutend;
			featureoutvalid <= featureoutvalid;
			featureoutvend <= featureoutvend;
		end
		else begin
			weightoutvalue <= weightvalue;
			featureoutvalue <= featurevalue;
			weigthoutvalid <= weigthvalid;
			weigthoutend <= featurevalid;
			featureoutvalid <= weigthend;
			featureoutvend <= featureend;
		end
	end

end



output wire resultvalid;
output wire [WL-1:0] resultvalue;



wire tmpacc;
wire tmpaccpre;

assign tmpacc = tmpweigthend&&tmpfeatureend;
assign tmpaccpre = weigthend&&featureend;

reg tmpvalid[PIPDEP - 1 : 0];


always @ (posedge clk)
begin
	if(rst) begin
		tmpvalid[0] <= 0;
	end
	else begin
		if (~ena) begin
			tmpvalid[0] <= tmpvalid[0];
		end
		else begin
			if (tmpacc == 1'b1 && tmpaccpre == 1'b0) begin
				tmpvalid[0] <= 1'b1;
			end
			else begin
				tmpvalid[0] <= 1'b0;
			end
		end
	end
end


genvar i;
generate
for (i = 1; i < PIPDEP; i = i + 1) begin: validloop
	always @ (posedge clk) 
	begin
		if(rst) begin
			tmpvalid[i] <= 0;
		end
		else begin
			tmpvalid[i] <= tmpvalid[i-1];
		end
	end
end
endgenerate



assign resultvalid = tmpvalid[PIPDEP - 1];

always @ (posedge clk)
begin
	if(rst) begin
		tmpweightvalue <= 0;
		tmpfeaturevalue <= 0;
		tmpweigthvalid <= 0;
		tmpfeaturevalid <= 0;
		tmpweigthend <= 0;
		tmpfeatureend <= 0;
	end
	else 
	begin
		if(~ena) begin
			tmpweightvalue <= tmpweightvalue;
			tmpfeaturevalue <= tmpfeaturevalue;
			tmpweigthvalid <= tmpweigthvalid;
			tmpfeaturevalid <= tmpfeaturevalid;
			tmpweigthend <= tmpweigthend;
			tmpfeatureend <= tmpfeatureend;
		end
		else begin
			tmpweightvalue <= weightvalue;
			tmpfeaturevalue <= featurevalue;
			tmpweigthvalid <= weigthvalid;
			tmpfeaturevalid <= featurevalid;
			tmpweigthend <= weigthend;
			tmpfeatureend <= featureend;
		end
	end
end 



MAC u0(
	.clk0       (clk),       //   input,   width = 1,       clk0.clk
	.ena        (ena),        //   input,   width = 1,        ena.ena
	.clr0       (rst),       //   input,   width = 1,       clr0.reset
	.result     (resultvalue),     //  output,  width = 32,     result.result
	.accumulate (tmpacc), //   input,   width = 1, accumulate.accumulate
	.ay         (tmpweightvalue),         //   input,  width = 32,         ay.ay
	.az         (tmpfeaturevalue)          //   input,  width = 32,         az.az
);



endmodule