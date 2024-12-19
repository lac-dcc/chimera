// Seed: 4057400186
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input uwire id_2,
    output wire id_3,
    output wor id_4,
    output supply1 id_5,
    input wor id_6,
    output tri1 id_7,
    output tri0 id_8,
    output wire id_9
);
  assign id_0 = id_6 ? 1 : 1'b0;
  wire id_11;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    output tri1 id_2,
    output tri0 id_3,
    output wor id_4,
    input supply0 id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri0 id_8,
    input tri1 id_9
);
  assign id_0 = 1;
  nor primCall (id_0, id_8, id_12, id_1, id_11, id_9, id_5, id_6);
  wire id_11 = id_1;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_0,
      id_0,
      id_7,
      id_5,
      id_7,
      id_11,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
