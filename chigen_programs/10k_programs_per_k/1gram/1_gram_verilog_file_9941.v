// Seed: 2703177768
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
    id_15
);
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_15 = 1'b0;
  wire id_16;
  if (id_14) assign id_7 = {id_11};
  assign id_13 = 1;
  id_17(
      id_16, id_2, id_2
  );
  assign id_7 = 1;
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_19;
  xnor primCall (
      id_4, id_12, id_5, id_1, id_8, id_16, id_19, id_7, id_3, id_17, id_15, id_18, id_10
  );
  module_0 modCall_1 (
      id_4,
      id_19,
      id_10,
      id_9,
      id_10,
      id_3,
      id_4,
      id_9,
      id_16,
      id_3,
      id_15,
      id_19,
      id_14,
      id_7,
      id_4
  );
  assign modCall_1.id_15 = 0;
  always id_19 = id_3;
endmodule
