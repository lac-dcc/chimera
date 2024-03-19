module sysarray(
	clk,
	ena,
	rst,
	// weight input 
	weightvalue,
	weigthvalid,
	weigthend,

	//feature  input
	featurevalue,
	featurevalid,
	featureend,

	// result out
	resultvalid,
	resultvalue
);


parameter WL = 32;
parameter NUM = 16;

input clk, ena, rst;

input [WL*NUM - 1:0] weightvalue, featurevalue;
input [NUM -1 :0] weigthvalid, weigthend, featurevalid, featureend;


output wire [WL*NUM*NUM - 1:0]  resultvalue;
output wire [NUM*NUM - 1:0] resultvalid;

wire [WL - 1:0] weightvaluewire[NUM - 1:0][NUM- 1:0], featurevaluewire[NUM - 1:0][NUM- 1:0];

wire weigthvalidwire[NUM - 1:0][NUM- 1:0], weigthendwire[NUM - 1:0][NUM- 1:0], featurevalidwire[NUM - 1:0][NUM- 1:0], featurevalidwire[NUM - 1:0][NUM- 1:0];

genvar i,j;
generate
for (i = 0; i < NUM; i = i + 1) begin: outerloop
	for (j = 0; j < NUM; j = j + 1) begin: innerloop
		
		wire [WL - 1:0] iweightvalue;
		wire iweigthvalid, iweigthend;

		assign iweightvalue = (j == 0)? weightvalue[WL*(i+1) - 1 : i*WL] : weightvaluewire[i][j-1];
		assign iweigthvalid = (j == 0)? weigthvalid[i]:  weigthvalidwire[i][j - 1];
		assign iweigthend = (j == 0)? weigthend[i]: weigthendwire[i][j-1];


		wire [WL - 1:0] ifeaturevalue;
		wire ifeaturevalid, ifeatureend;

		assign ifeaturevalue = (i == 0)? featurevalue[WL*(j+1) - 1 : j*WL] : featurevaluewire[i - 1][j];
		assign ifeaturevalid = (i == 0)? featurevalid[i]:  featurevalidwire[i - 1][j];
		assign ifeatureend = (i == 0)? featureend[i]: featurevalidwire[i - 1][j];


		wire [WL - 1:0] iweightvalueout;
		wire iweigthvalidout, iweigthendout;

		assign iweightvalueout = weightvaluewire[i][j];
		assign iweigthvalidout = weigthvalidwire[i][j];
		assign iweigthendout =  weigthendwire[i][j];


		wire [WL - 1:0] ifeaturevalueout;
		wire ifeaturevalidout, ifeatureendout;

		assign ifeaturevalueout = featurevaluewire[i][j];
		assign ifeaturevalidout = featurevalidwire[i][j];
		assign ifeatureendout = featurevalidwire[i][j];
		
		sysunit ins(
				.clk(clk),
				.ena(ena),
				.rst(rst),
				// weight input 
				.weightvalue(iweightvalue),
				.weigthvalid(iweigthvalid),
				.weigthend(iweigthend),

				// weight shift 
				.weightoutvalue(iweightvalueout),
				.weigthoutvalid(iweigthvalidout),
				.weigthoutend(iweigthendout),

				//feature  input
				.featurevalue(ifeaturevalue),
				.featurevalid(ifeaturevalid),
				.featureend(ifeatureend),

				//feature  shift
				.featureoutvalue(ifeaturevalueout),
				.featureoutvalid(ifeaturevalidout),
				.featureoutvend(ifeatureendout),


				// result out
				.resultvalid(resultvalid[i*NUM + j]),
				.resultvalue(resultvalue[i*NUM*WL + (j + 1)*WL - 1 : i*NUM*WL + j*WL])
			);


	end

end
endgenerate


endmodule
