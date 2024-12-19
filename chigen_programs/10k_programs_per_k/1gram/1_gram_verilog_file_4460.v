// Seed: 2475136333
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  wire id_5, id_6;
  id_7(
      1
  );
  wire id_8, id_9;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
macromodule module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1
  );
endmodule
