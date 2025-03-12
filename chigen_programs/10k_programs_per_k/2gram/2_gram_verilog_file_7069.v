// Seed: 4150904412
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4
);
  logic id_6;
  xor primCall (id_4, id_0, id_2);
  wire id_7;
  module_2 modCall_1 (
      id_7,
      id_6,
      id_7
  );
endmodule
module module_1 #(
    parameter id_4 = 32'd36
) (
    input uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output supply0 _id_4,
    output wor id_5
);
  assign id_1 = id_0;
  logic [id_4 : -1] id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_9 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
