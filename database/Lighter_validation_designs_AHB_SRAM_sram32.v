module sram32 #(parameter AW=10, VERBOSE=1) (
    input  wire         clk,
    input  wire         cs,
    input  wire [3:0]   we,
    input  wire [AW-1:0] A,
    input  wire [31:0]  Di,
    output reg  [31:0]  Do
);
    reg[31:0] ram[(2**AW)-1:0];
    always @(posedge clk)
        if(cs) begin
            Do <= ram[A];
            if(we[0]) ram[A][ 7: 0] <= Di[7:0];
            if(we[1]) ram[A][15:8] <= Di[15:8];
            if(we[2]) ram[A][23:16] <= Di[23:16];
            if(we[3]) ram[A][31:24] <= Di[31:24];
            if(VERBOSE==1) begin
                if(we==0) $display("SRAM READ from %0h data %0h", A, Do);
                else $display("SRAM Write (%0h):  %0h to %0h", we, Di, A);
            end
        end 
endmodule