// Seed: 837450695
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    output wor id_2,
    input supply0 id_3,
    input logic id_4,
    input wire id_5,
    input tri0 id_6,
    input wire id_7,
    inout tri0 id_8,
    input tri1 id_9,
    output wor id_10,
    input tri0 id_11,
    output uwire id_12,
    output supply1 id_13,
    input tri id_14,
    output wand id_15,
    input wand id_16,
    input supply1 id_17,
    input tri0 id_18,
    output logic id_19,
    input uwire id_20,
    input wand id_21,
    input wand id_22,
    input tri id_23,
    output tri0 id_24,
    input wire id_25,
    output wor id_26
);
  initial id_19 <= #1 id_4;
  id_28(
      .id_0(id_17), .id_1(id_15)
  );
  wire id_29;
  wor  id_30 = 1;
  module_0 modCall_1 (
      id_30,
      id_29,
      id_29,
      id_29,
      id_29,
      id_29,
      id_30,
      id_30,
      id_29,
      id_29,
      id_29,
      id_30,
      id_29
  );
  tri1 id_31;
  id_32(
      .id_0(1'h0), .id_1(1), .id_2(id_31 <-> id_16)
  ); id_33 :
  assert property (@(posedge id_16) 1)
  else;
endmodule
