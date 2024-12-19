// Seed: 514920700
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
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_27;
  assign id_20 = 1'b0;
  assign module_1.id_24 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input wire id_2,
    input tri1 id_3,
    input wire id_4,
    input wor id_5,
    output tri1 id_6,
    input wire id_7
    , id_29, id_30,
    input supply1 id_8,
    input uwire id_9
    , id_31,
    input tri1 id_10,
    input tri id_11,
    input wand id_12,
    input supply1 id_13,
    input wor id_14,
    input wor id_15,
    input wand id_16,
    input wire id_17
    , id_32,
    input supply1 id_18,
    input wor id_19,
    output tri0 id_20,
    input tri1 id_21,
    input tri id_22,
    input supply1 id_23,
    input tri0 id_24,
    output supply0 id_25,
    input tri id_26,
    input wor id_27
);
  assign id_30 = 1;
  wire id_33;
  id_34(
      .id_0(1), .id_1(1), .id_2(id_33), .id_3(), .id_4(id_23)
  );
  logic [7:0] id_35;
  id_36(
      id_5
  );
  assign id_35[1] = 1;
  wire id_37;
  id_38 :
  assert property (@(!id_15) id_3 == id_21)
  else;
  module_0 modCall_1 (
      id_38,
      id_29,
      id_29,
      id_29,
      id_37,
      id_32,
      id_31,
      id_29,
      id_31,
      id_36,
      id_31,
      id_29,
      id_32,
      id_33,
      id_38,
      id_33,
      id_32,
      id_32,
      id_32,
      id_32,
      id_29,
      id_29,
      id_37,
      id_30,
      id_37,
      id_37
  );
  wire id_39;
endmodule
