// Seed: 2374943941
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6 = id_1 == 1;
  assign module_2.type_1 = 0;
  assign module_1.id_2   = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1 > id_2;
  id_3();
  not primCall (id_2, id_1);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
  wire id_4;
endmodule
module module_2 (
    input wor id_0,
    input wand id_1,
    input supply1 id_2
    , id_10,
    input supply0 id_3,
    output uwire id_4,
    input tri0 id_5,
    output wand id_6,
    output supply0 id_7,
    output uwire id_8
);
  specify
    (id_11 + => id_12) = (1 < 1'b0, id_0 == 1);
    (id_13 => id_14) = 1;
  endspecify
  nor primCall (id_4, id_13, id_2, id_0, id_5, id_10, id_14, id_1, id_11, id_3, id_12);
  module_0 modCall_1 (
      id_14,
      id_10,
      id_12,
      id_12,
      id_13
  );
endmodule
