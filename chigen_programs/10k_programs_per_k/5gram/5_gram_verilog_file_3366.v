// Seed: 1665758311
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5 = id_1;
  assign id_3[1] = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_5(
      .id_0(id_2), .id_1(1), .id_2(1)
  );
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3,
      id_4
  );
  wire id_7;
  assign id_4 = id_3;
  wire id_8 = id_7;
  wire id_9;
endmodule
