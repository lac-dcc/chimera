// Seed: 3877134343
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  assign id_7 = id_3;
  id_9(
      .id_0(1), .id_1(id_7), .id_2(-1'b0), .id_3()
  );
  tri1 id_10 = id_3 | $realtime;
endmodule
module module_1 (
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_9 = id_11 == id_13;
  specify
    $width(negedge id_14 &&& id_1, id_8, 1, id_15);
  endspecify
  module_0 modCall_1 (
      id_8,
      id_12,
      id_4,
      id_4,
      id_9,
      id_4,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
