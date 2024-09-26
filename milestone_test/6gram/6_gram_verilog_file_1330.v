// Seed: 2922359840
module module_0 (
    output id_0,
    output reg id_1,
    input id_2,
    input id_3
);
  always @(!id_2 or id_3) begin
    if (id_3) begin
      id_1 <= id_2;
    end
  end
endmodule
