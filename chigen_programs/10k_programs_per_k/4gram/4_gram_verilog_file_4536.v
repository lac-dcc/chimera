// Seed: 1626692963
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  id_11(
      .id_0(1), .id_1(1), .id_2(id_2)
  );
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4,
    output wire id_5,
    input tri id_6,
    output uwire id_7
    , id_26,
    input tri0 id_8,
    input wor id_9,
    output tri0 id_10,
    output wand id_11,
    input tri1 id_12,
    output wand id_13,
    input supply0 id_14,
    output wor id_15,
    input tri0 id_16,
    input wor id_17,
    input wand id_18,
    output tri0 id_19,
    input supply1 id_20,
    output tri1 id_21,
    input tri0 id_22,
    output tri1 id_23,
    output wor id_24
);
  tri0 id_27;
  wire id_28;
  wire id_29, id_30, id_31;
  module_0 modCall_1 (
      id_26,
      id_27,
      id_29,
      id_28,
      id_26,
      id_31,
      id_26,
      id_29,
      id_27
  );
  id_32(
      .id_0(id_1), .id_1(1), .id_2(), .id_3(1'h0)
  );
  wire id_33, id_34, id_35, id_36, id_37;
  wire id_38;
  assign id_27 = (id_3 == 1);
  wire id_39 = 1;
  xnor primCall (
      id_23,
      id_22,
      id_3,
      id_17,
      id_18,
      id_27,
      id_31,
      id_16,
      id_14,
      id_28,
      id_29,
      id_9,
      id_20,
      id_8,
      id_30,
      id_0,
      id_12,
      id_26
  );
endmodule
