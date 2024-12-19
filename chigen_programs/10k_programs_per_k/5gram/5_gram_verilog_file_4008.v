// Seed: 3833801926
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  specify
    (negedge id_6 => (id_7 +: 1)) = (id_1  : id_2  : id_1 - id_6, id_7);
    if (1) (id_8 => id_9) = (1  : id_1 == 1 > 1  : id_7);
  endspecify
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
