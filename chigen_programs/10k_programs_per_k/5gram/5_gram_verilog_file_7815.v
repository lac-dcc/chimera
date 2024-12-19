// Seed: 1288311744
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
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_5 + 1 ? id_5 : 1 ~^ 1 ? 1'b0 : id_14 == id_8++ ? 1 : 1 ? 1 : 1'b0;
endmodule
module module_1 (
    input wire id_0
    , id_17,
    input tri0 id_1
    , id_18,
    output supply0 id_2,
    output uwire id_3,
    input tri1 id_4,
    output uwire id_5,
    output supply1 id_6,
    output wand id_7,
    output tri1 id_8,
    input uwire id_9,
    output wand id_10,
    output supply0 id_11,
    input supply1 id_12,
    input tri1 id_13,
    output tri0 id_14,
    input supply0 id_15
);
  wand id_19 = id_4 ? 1 : 1 - 1;
  assign id_10 = 1'b0;
  assign id_14 = id_12;
  wire id_20;
  assign id_18 = 1 ^ 1;
  assign id_5  = 1;
  wire id_21;
  module_0 modCall_1 (
      id_21,
      id_19,
      id_19,
      id_17,
      id_20,
      id_19,
      id_17,
      id_19,
      id_19,
      id_17,
      id_17,
      id_21,
      id_19,
      id_20,
      id_20
  );
  always @((id_9)) $display(1);
  wire id_22;
  id_23(
      .id_0(id_6), .id_1(id_14), .id_2(1), .id_3(!(id_19)), .id_4(1), .id_5(id_15)
  );
endmodule
