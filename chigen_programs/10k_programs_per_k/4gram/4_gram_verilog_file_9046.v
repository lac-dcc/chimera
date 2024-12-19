// Seed: 1204194006
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  supply1 id_3 = 1;
  assign module_2.type_18 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  assign modCall_1.type_4 = 0;
endmodule
module module_2 (
    input wire id_0,
    input supply1 id_1,
    output tri1 id_2,
    output tri1 id_3,
    output tri0 id_4,
    output wor id_5,
    output wire id_6,
    output tri id_7,
    input wire id_8
);
  wire id_10 = id_10;
  wire id_11;
  module_0 modCall_1 (
      id_10,
      id_10
  );
  specify
    (id_12 => id_13) = (id_11);
    (id_14 => id_15) = (id_0, 1);
    (id_16 => id_17) = 1;
  endspecify
endmodule
