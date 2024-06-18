// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for inner product in Axiline
//

module ip#(
    parameter bitwidth =16,
	parameter inputBitwidth=8,
    parameter size=8
)(
    input[inputBitwidth*size-1:0] x,
    input[bitwidth*size-1:0] w,
    output [bitwidth-1:0]sum
);

    genvar i;
	wire [bitwidth-1:0]isum[size-1:0];
    generate
        for (i=0;i<size;i=i+1)begin: LOOP
            //wire [bitwidth-1:0]isum;
            if (i==0)begin
                assign isum[i]=w[bitwidth-1:0]*x[inputBitwidth-1:0];
            end else begin
                assign isum[i]=isum[i-1]+w[bitwidth*i+bitwidth-1:bitwidth*i]*x[inputBitwidth*i+inputBitwidth-1:inputBitwidth*i];
            end
        end
    endgenerate
    assign sum=isum[size-1];

endmodule

