// Seed: 2634104023
module module_0 (
    input wire id_0,
    input wand id_1,
    output uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply0 id_5#(
        .id_22(-1),
        .id_23(1),
        .id_24((-1)),
        .id_25(1)
    ),
    output wire id_6,
    input tri1 id_7,
    input wand id_8,
    input tri0 id_9,
    input wor id_10,
    input supply1 id_11,
    input wand id_12
    , id_26,
    input wand id_13,
    output supply1 id_14,
    input supply0 id_15,
    input wire id_16,
    input supply0 id_17,
    input wor id_18,
    input supply0 id_19,
    input tri1 id_20
);
  wire id_27;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3,
    output supply1 id_4,
    output tri1 id_5,
    input tri id_6,
    input tri id_7
);
  integer id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_2,
      id_1,
      id_0,
      id_7,
      id_1,
      id_5,
      id_0,
      id_2,
      id_6,
      id_1,
      id_6,
      id_2
  );
  wire id_10;
  wire id_11;
  always_comb begin : LABEL_0
    forever id_9[1 : 1] = id_1;
  end
  nor primCall (id_4, id_7, id_0, id_9, id_1, id_3, id_6);
  logic id_12;
  ;
  wire id_13;
endmodule
