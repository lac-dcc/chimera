// Seed: 3875046295
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
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  id_17(
      .id_0(id_6), .id_1(1), .id_2(id_1), .id_3(1), .id_4(1)
  );
  supply1 id_18;
  assign id_15 = id_3;
  id_19(
      id_18 ^ id_2, id_8, 1'd0
  );
  wire id_20;
  specify
    (id_21 => id_22) = (id_12  : 1  : 1 != id_22, id_2);
  endspecify
endmodule
module module_1 (
    input  wand id_0,
    input  wire id_1
    , id_5,
    input  wand id_2,
    output tri  id_3
);
  wire id_6;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5
  );
endmodule
