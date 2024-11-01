// Seed: 648426846
module module_0 (
    output wire id_0,
    output wor id_1,
    input wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wand id_5,
    output wand id_6,
    input tri0 id_7,
    input wire id_8,
    input tri0 id_9,
    input tri1 id_10,
    output wor id_11,
    output tri0 id_12,
    output uwire id_13,
    output supply1 id_14,
    input tri id_15,
    input tri0 id_16
);
  id_18(
      .id_0(1)
  );
  wire id_19, id_20, id_21, id_22;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    output wire id_3,
    output supply1 id_4,
    output wor id_5,
    output tri0 id_6,
    output supply1 id_7,
    input supply1 id_8,
    output wire id_9,
    input uwire id_10,
    output uwire id_11,
    input tri id_12,
    output tri id_13,
    output tri0 id_14,
    output tri1 id_15
);
  assign id_13 = id_8 == -1;
  id_17 :
  assert property (@(posedge 1 - id_0 ? ~1 : 1 or posedge id_17) 1)
  else;
  module_0(
      id_6,
      id_11,
      id_10,
      id_12,
      id_0,
      id_12,
      id_13,
      id_12,
      id_8,
      id_8,
      id_0,
      id_9,
      id_3,
      id_2,
      id_1,
      id_12,
      id_10
  );
endmodule
