// Seed: 4166756643
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  specify
    if (id_5) (id_7 => id_8) = 1;
    (id_9 => id_10) = 1;
    (id_11 => id_12) = (id_9  : 1  : id_8, id_1);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_8 = 0;
  wire id_4;
endmodule
