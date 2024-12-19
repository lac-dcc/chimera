// Seed: 2796090036
module module_0 (
    output wire id_0,
    output wire id_1,
    input supply0 id_2
    , id_24,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input tri0 id_6,
    input wire id_7,
    input wire id_8,
    input tri0 id_9,
    output wor id_10,
    input tri0 id_11
    , id_25,
    output supply1 id_12,
    input wor id_13,
    input tri0 id_14,
    input supply1 id_15,
    input wand id_16,
    input wor id_17,
    input supply1 id_18,
    output wire id_19,
    input wor id_20,
    output supply0 id_21,
    input supply0 id_22
);
  specify
    (id_26 => id_27) = (id_13, 1'h0 : {1} : id_18, 1);
  endspecify
  wire id_28;
  assign module_1.id_0 = 0;
  supply1 id_29 = 1;
  wire id_30, id_31;
  always
    if (1) id_29 = (1);
    else;
endmodule
module module_1 (
    output uwire id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output logic id_4,
    input  wire  id_5,
    output wire  id_6,
    input  tri1  id_7,
    input  tri   id_8
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_8,
      id_5,
      id_1,
      id_5,
      id_8,
      id_3,
      id_2,
      id_1,
      id_5,
      id_0,
      id_7,
      id_3,
      id_5,
      id_2,
      id_8,
      id_8,
      id_6,
      id_2,
      id_1,
      id_2
  );
  for (id_10 = (1'b0); id_5 * 1; id_0 = id_7) wire id_11;
  initial id_4 <= id_10;
  assign id_6 = !id_8;
endmodule
