// Seed: 3570922758
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = 1;
  wire id_7;
  wire id_8 = id_6;
  id_9(
      .id_0(id_2), .id_1(id_7)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_2 = 1;
  id_5(
      .id_0(1), .id_1(1), .id_2(1)
  );
endmodule
