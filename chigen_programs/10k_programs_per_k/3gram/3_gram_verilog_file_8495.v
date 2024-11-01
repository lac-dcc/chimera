// Seed: 1796841047
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  tri1 id_3;
  tri1 id_4;
  assign id_3 = id_4;
  always_ff @(negedge id_4) begin
    id_3 = 1'b0;
    id_2 = id_1;
  end
  id_5(
      'd0, 1
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  supply1 id_3;
  module_0(
      id_3, id_2
  ); id_4 :
  assert property (@(posedge id_3 * id_2) id_3)
  else id_1 = id_4;
  wire id_5;
  id_6(
      .id_0(1'b0), .id_1(id_5), .sum(1)
  );
endmodule
