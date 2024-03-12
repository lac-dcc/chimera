module grf(
    input clk,
    input reset,
    input WE,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    output [31:0] RD1,
    output [31:0] RD2
);

    reg [31:0] register[31:0];
    integer i;

    initial begin
        for(i=0; i<32; i=i+1) begin
            register[i] <= 32'h0000_0000;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            for(i=0; i<32; i=i+1)
                register[i] <= 32'h0000_0000;
        end
        else if(WE&&A3!=5'd0) begin
            register[A3] <= WD;
        end
    end

    assign RD1 =    (A1==5'd0)      ?   32'h0000_0000 : 
                    (A1==A3)&&WE    ?   WD : 
                                        register[A1];
    assign RD2 =    (A2==5'd0)      ?   32'h0000_0000 : 
                    (A2==A3)&&WE    ?   WD : 
                                        register[A2];

endmodule // grf