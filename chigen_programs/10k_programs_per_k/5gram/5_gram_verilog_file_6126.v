// Seed: 2099751923
module module_0 (
    input  uwire id_0,
    output tri   id_1,
    input  tri   id_2,
    input  wire  id_3
);
  id_5(
      .id_0(id_6),
      .id_1(id_0),
      .id_2(1),
      .id_3(id_3 + id_0),
      .id_4("" ^ "" + 1 * 1 + id_3),
      .id_5(1)
  );
endmodule
module module_1 (
    output tri1 id_0,
    output tri  id_1,
    input  tri1 id_2
);
  id_4 :
  assert property (@(posedge id_4) id_4 == id_4 > !id_4)
  else $display(1);
  module_0(
      id_2, id_0, id_2, id_2
  );
endmodule
