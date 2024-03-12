module hilo_reg(/*autoport*/
//output
            rdata,
//input
            clk,
            rst_n,
            we,
            wdata);

input wire clk;
input wire rst_n;

input wire we;
input wire[63:0] wdata;
output wire[63:0] rdata;

reg[63:0] hilo;

always @(posedge clk) begin
    if(!rst_n) begin
        hilo <= 64'b0;
    end
    else if(we) begin
        hilo <= wdata;
    end
end

assign rdata = we ? wdata : hilo;

endmodule
