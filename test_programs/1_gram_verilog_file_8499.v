// Seed: 3569299305
module module_0 (
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  uwire id_17;
  supply0 id_18 = {
    -1, 1'b0 - id_6, -1, id_1, {id_5, (id_12), 1, 1, 1, id_18, id_16, -1'b0, id_3, 1}
  };
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_4(
      1'b0
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_18 = 0;
endmodule
