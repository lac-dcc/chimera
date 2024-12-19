// Seed: 613425569
module module_0 (
    output tri1  id_0,
    input  tri1  id_1,
    input  wor   id_2,
    output wor   id_3,
    input  tri   id_4,
    output wire  id_5,
    input  wand  id_6,
    input  uwire id_7
);
  id_9(
      .id_0(1'b0), .id_1(), .id_2(id_4), .id_3(id_1), .id_4(id_5)
  );
  wire id_10;
  assign module_1.id_19 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output logic id_5,
    output supply0 id_6,
    input wire id_7,
    input tri id_8,
    input supply0 id_9,
    output wor id_10,
    input wand id_11,
    output supply1 id_12,
    input tri0 id_13,
    output uwire id_14,
    input wand id_15,
    input supply0 id_16,
    output wand id_17,
    output tri0 id_18,
    input tri1 id_19,
    output wire id_20
    , id_24,
    output supply1 id_21,
    output supply1 id_22
);
  id_25 :
  assert property (@(posedge 1) id_1)
  else id_5 <= 1;
  module_0 modCall_1 (
      id_20,
      id_9,
      id_3,
      id_12,
      id_2,
      id_18,
      id_2,
      id_0
  );
endmodule
