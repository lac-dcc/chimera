// Seed: 1417508759
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    output supply1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    output tri id_6,
    id_16,
    output tri1 id_7,
    input wor id_8,
    output supply0 id_9,
    output wor id_10,
    output wor id_11,
    input wire id_12,
    output tri0 id_13,
    input wand id_14
);
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output wire  id_2,
    output uwire id_3
);
  always id_2 <<= id_1;
  always
    if (id_1)
      `define pp_5 0
    else id_0 <= -1;
  uwire id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.type_1 = 0;
  if (id_6) initial @(id_1 && -1 or negedge -1) `pp_5 = `pp_5 && id_1;
  assign (highz1, supply0) `pp_5 = `pp_5;
endmodule
