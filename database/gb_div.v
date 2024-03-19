//
// Clock Divider
//

module div(in, out);

// division amount
parameter DIV = 1;
parameter COUNT = DIV / 2;

input in;
output reg out;

reg [$clog2(COUNT)-1:0] count = 0;

always @(posedge in) begin
    if (count == COUNT-1) begin
        out <= ~out;
        count <= 0;
    end else begin
        count <= count + 1'b1;
    end
end

endmodule
