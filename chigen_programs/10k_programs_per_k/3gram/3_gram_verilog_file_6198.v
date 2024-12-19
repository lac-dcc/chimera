// Seed: 1980432274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  wire id_7;
  assign id_4 = 1;
  id_8 :
  assert property (@(id_8) id_7)
  else id_6 = 1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
