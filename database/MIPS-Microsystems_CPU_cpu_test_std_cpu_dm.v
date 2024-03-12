module dm(
    input clk,
    input reset,
    input WE,
    input [3:0] BE,
    input [31:0] addr,
    input [31:0] WD,
    output [31:0] RD
);

    reg [31:0] ram[4095:0];
    reg [31:0] data;
    integer i;

    initial begin
        for(i=0; i<4096; i=i+1) begin
            ram[i] <= 32'h0000_0000;
        end
    end

    always @(*) begin
        case (BE)
            4'b0001:    data <= {RD[31:8], WD[7:0]};
            4'b0010:    data <= {RD[31:16], WD[7:0], RD[7:0]};
            4'b0100:    data <= {RD[31:24], WD[7:0], RD[15:0]};
            4'b1000:    data <= {WD[7:0], RD[23:0]};
            4'b0011:    data <= {RD[31:16], WD[15:0]};
            4'b1100:    data <= {WD[15:0], RD[15:0]};
            4'b1111:    data <= WD;
            default:    data <= RD;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            for(i=0; i<4096; i=i+1) begin
                ram[i] <= 32'h0000_0000;
            end
        end 
        else if(WE) begin
            ram[addr[13:2]] <= data;
        end
    end

    assign RD = ram[addr[13:2]];

endmodule // dm