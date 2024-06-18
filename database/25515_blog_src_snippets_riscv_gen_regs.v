// This program was cloned from: https://github.com/suda-morris/blog
// License: GNU General Public License v3.0

module gen_regs (
    input  clk,
    input  reset,
    input  wen,
    input  [4:0] regRAddr1, regRAddr2, regWAddr,
    input  [31:0] regWData,
    output [31:0] regRData1,
    output [31:0] regRData2
);
    integer ii;
    reg [31:0] regs[31:0];

    // write registers
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(ii=0; ii<32; ii=ii+1)
                regs[ii] <= 32'b0;
        end
        else if(wen & (|regWAddr))
                regs[regWAddr] <= regWData;
    end

    // read registers
    assign regRData1 = wen & (regWAddr == regRAddr1) ? regWData
                    : ((regRAddr1 != 5'b0) ? regs[regRAddr1] : 32'b0);
    assign regRData2 = wen & (regWAddr == regRAddr2) ? regWData
                    : ((regRAddr2 != 5'b0) ? regs[regRAddr2] : 32'b0);

endmodule
