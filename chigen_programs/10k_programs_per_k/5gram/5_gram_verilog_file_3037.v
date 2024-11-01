// Seed: 1446874913
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input tri1 id_4
);
  tri id_6;
  assign id_1 = 1 ? id_3 : 1 & 1 + id_6 < id_4;
  wire id_7;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1
);
  pullup (weak1) (id_1, id_0, {id_0 == 1, 1});
  supply1 id_3;
  assign id_3 = id_1;
  id_4 :
  assert property (@(posedge id_4 == id_0) id_4++)
  else $display(1 < "", id_4);
  module_0(
      id_3, id_3, id_0, id_3, id_3
  ); id_5(
      .id_0(1'b0),
      .id_1(1'b0),
      .id_2(id_3),
      .id_3(id_4 == 1'b0),
      .id_4(id_3),
      .id_5(1),
      .id_6(1),
      .id_7(id_4)
  );
endmodule
