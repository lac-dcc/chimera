//
//      verilog template for inner product in Axiline
//

module pipeline_reg #(
    parameter bitwidth =8,
    parameter num_stage=2,
    parameter en_rst = 0
)(
    input clk,
    input rst,
    input [bitwidth-1:0]data_in,
    output  [bitwidth-1:0] data_out
);
    genvar i;
    generate
        if(num_stage != 0 ) begin
            reg [bitwidth-1:0] data[0:num_stage-1];
            for(i=0;i<num_stage;i=i+1) begin:STAGE
                if ( en_rst == 0 ) begin
                    always @(posedge clk )
                        data[i] <= (i==0) ? data_in : data[i-1];
                end
                else begin
                    always @(posedge clk or posedge rst)begin
                            if(rst)
                                data[i] <= {bitwidth{1'b0}};
                            else
                                data[i] <= (i == 0) ? data_in : data[i-1];
                    end
                end
            end
            assign data_out = data[num_stage-1];
        end else
            assign data_out=data_in;
    endgenerate
endmodule
