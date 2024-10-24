// Seed: 802250427
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  reg id_5;
  generate
    initial begin
      id_2 <= 1 != id_4;
    end
  endgenerate
  assign id_2 = ~id_1;
  always @(posedge 1'b0)
    if (~id_1) begin
      if (id_1) id_2 <= id_5;
      else if (1) begin
        id_5 <= id_5;
        id_5 <= id_1;
        id_5 = 1;
      end
    end
endmodule
