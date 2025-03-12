// Seed: 1202092687
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output tri id_3,
    input wand id_4,
    input wand id_5,
    input wire id_6,
    output tri0 id_7,
    input supply0 id_8,
    output wire id_9
);
  assign id_3 = id_8;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output uwire id_5,
    input tri1 id_6,
    input wire id_7,
    inout tri id_8
);
  assign id_1 = id_7;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_1,
      id_8,
      id_3,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
