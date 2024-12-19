// Seed: 3169695295
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
  id_10(
      id_1 <-> id_6, 1
  );
  wire id_11;
  wire id_12;
  assign id_2 = 1'h0;
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_5(
      .id_0(id_4), .id_1(id_3)
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_4,
      id_1,
      id_2,
      id_1
  );
endmodule
