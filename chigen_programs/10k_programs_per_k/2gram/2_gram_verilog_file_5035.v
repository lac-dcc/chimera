// Seed: 3193990239
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wor id_3,
    input supply0 id_4,
    input tri id_5,
    output tri0 id_6,
    input tri0 id_7,
    output wor id_8
);
  wire id_10;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    output wire id_2,
    input tri id_3,
    input wor id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wand id_7,
    input wor id_8,
    input tri0 id_9,
    input wand id_10,
    output tri0 id_11,
    output logic id_12,
    output wire id_13,
    output wor id_14,
    input supply0 id_15,
    output tri0 id_16,
    output tri0 id_17,
    output wand id_18,
    input tri1 id_19,
    output wand id_20,
    input logic id_21,
    input tri0 id_22,
    output wand id_23,
    output tri id_24
);
  wire id_26;
  module_0 modCall_1 (
      id_22,
      id_10,
      id_5,
      id_5,
      id_8,
      id_3,
      id_20,
      id_8,
      id_26
  );
  assign modCall_1.type_15 = 0;
  always_latch id_12 = #1 id_21;
  assign id_26 = {(1) <-> 1'b0, id_19, id_19};
  id_27(
      .id_0(1)
  );
  wire id_28;
  wire id_29;
  wire id_30;
  id_31 :
  assert property (@(posedge id_0) id_7)
  else;
  id_32(
      .id_0(id_9), .id_1(id_15)
  );
  wire id_33;
endmodule
