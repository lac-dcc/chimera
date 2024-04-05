//
//      verilog template for inner product in Axiline
//

module ip#(
    parameter bitwidth =8,
    parameter size=8
)(
    input[bitwidth*size-1:0] x,
    input[bitwidth*size-1:0] w,
    input[bitwidth-1:0] psum,
    input sel,
    output [bitwidth-1:0]sum,
);

    wire [bitwidth-1:0]psum_sel;
    assign psum_sel=sel?psum:0;
    wire [bitwidth-1:0] x[size-1:0];
    wire [bitwidth-1:0] w[size-1:0];
    genvar i;
    generate
        for (i=0;i<size;i=i+1)begin: LOOP
            wire [bitwidth-1:0]isum;
            if (i==0)begin
                assign isum=w[bitiwdth-1:0]*x[bitiwdth-1:0];
            end else begin
                assign isum=LOOP[i-1].isum+w[bitiwidth*i+bitiwdth-1:bitiwidth*i]*x[bitiwidth*i+bitiwdth-1:bitiwidth*i];
            end
        end
    endgenerate
    assign sum=LOOP[size-1].isum + psum_sel;

endmodule
