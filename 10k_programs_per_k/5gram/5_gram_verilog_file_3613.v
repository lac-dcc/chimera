// Seed: 2699129757
module module_0 (
    input id_0,
    output reg id_1,
    output reg id_2
);
  always @(*) begin
    if (id_0) id_2 <= 1;
    else id_1 <= id_0;
  end
endmodule
