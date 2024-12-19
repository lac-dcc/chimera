// Seed: 862603317
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_4 = (1);
  wand id_5 = 1 ? 1 & 1'b0 : 1;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3,
    input wand id_4,
    input tri id_5
);
  wire id_7, id_8;
  xnor primCall (id_3, id_10, id_7, id_0, id_9, id_2);
  wire id_9, id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_5(
      .id_0(id_2),
      .id_1(1),
      .id_2(1'b0),
      .id_3(id_2),
      .id_4(id_2),
      .id_5(1 - 1 && id_1),
      .id_6(1),
      .id_7(1'h0 !== id_1)
  );
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3
  );
endmodule
