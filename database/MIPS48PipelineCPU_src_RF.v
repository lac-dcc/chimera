`define zero 0
`define gp 28
`define sp 29
`define GPDEFAULT 32'h00001800
`define SPDEFAULT 32'h00002ffc

module RF(Clk,We,A1,A2,A3,WD,RD1,RD2);
    
    input  wire   Clk;
    input  wire   We;
    input  [4:0]  A1,A2,A3;
    input  [31:0] WD;
    output [31:0] RD1,RD2;           
    
    integer i;

    reg [31:0] rf[31:0];

    initial begin
        rf[`zero] <= 0;
        rf[`sp  ] <= `SPDEFAULT;
        rf[`gp  ] <= `GPDEFAULT;
    end

    always @(posedge Clk) begin        
        if (We === 1 && A3 != 0) begin
            rf[A3] <= WD;
            $display("%5d:[%m]Register[%d] <= %h",$time,A3,WD);
            $display("寄存器内容:");
            for (i=0; i<32; i=i+1) begin
                 $display("Register[%2d] = %h",i,mips.RF.rf[i]);
            end    
        end
    end

    wire [31:0] rd1;
    wire [31:0] rd2;

    assign rd1Sel = WD && (A1 == A3);
    assign rd2Sel = WD && (A2 == A3);

    MUX rd1mux(rf[A1],WD,rd1Sel,rd1);
    MUX rd2mux(rf[A2],WD,rd2Sel,rd2);

    assign RD1 = (A1 != 0) ? rd1 : 0;
    assign RD2 = (A2 != 0) ? rd2 : 0;

endmodule
