// Seed: 3740467619
module module_0 (
    id_1,
    id_2,
    .id_5(id_3),
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_6;
  uwire id_7;
  assign id_1 = 1;
  assign id_7 = id_5;
  assign id_5 = id_5 - id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1[1'h0] = id_2;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
