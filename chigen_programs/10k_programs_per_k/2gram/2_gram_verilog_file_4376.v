// Seed: 956212242
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    output wand id_3,
    output uwire id_4,
    output supply0 id_5,
    input tri id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input wor id_12,
    input wor id_13,
    output supply0 id_14,
    output wand id_15,
    input wand id_16,
    input tri id_17
    , id_19
);
  integer id_20 = 1;
  assign module_1.id_1 = 0;
  initial @(posedge id_19 or posedge 1);
  wor  id_21 = 1;
  wire id_22;
endmodule
program module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wand id_6,
    input wand id_7,
    input tri0 id_8,
    output uwire id_9#(
        .id_24(1),
        .id_25(1)
    ),
    output tri1 id_10,
    output wire id_11,
    input tri id_12,
    output logic id_13,
    output tri1 id_14,
    input logic id_15,
    input tri id_16,
    output tri0 id_17,
    input wire id_18,
    output supply0 id_19,
    input uwire id_20,
    output uwire id_21
    , id_26,
    input wire id_22
);
  id_27 :
  assert property (@(posedge 1 & id_22) 1 + id_7)
  else id_13 <= id_15;
  module_0 modCall_1 (
      id_20,
      id_16,
      id_10,
      id_11,
      id_17,
      id_19,
      id_16,
      id_22,
      id_10,
      id_7,
      id_20,
      id_1,
      id_1,
      id_2,
      id_19,
      id_9,
      id_6,
      id_0
  );
endprogram
