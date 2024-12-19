// Seed: 263167664
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
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
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  specify
    (posedge id_14 => (id_15 +: 1)) = (id_10, id_10);
    if (1'b0) (posedge id_16 => (id_17 +: 1)) = (1, 1);
  endspecify
  module_0 modCall_1 (
      id_6,
      id_17,
      id_14,
      id_5,
      id_16,
      id_15
  );
  assign modCall_1.id_2 = 0;
endmodule
