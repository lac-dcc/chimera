// Seed: 484995666
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  id_3(
      1, id_2, -1
  );
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  id_4(
      .id_0(1), .id_1($realtime), .id_2(1'b0), .id_3(!id_2), .id_4(id_3)
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_14 = $realtime;
  assign id_6  = -1;
  module_0 modCall_1 (
      id_18,
      id_18
  );
  id_21(
      1, id_17[-1], id_4, id_7, -1'b0
  );
  assign id_16 = !id_1;
endmodule
