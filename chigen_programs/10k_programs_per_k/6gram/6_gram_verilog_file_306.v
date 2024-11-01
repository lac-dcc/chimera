// Seed: 4190618825
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wor id_4,
    input wor id_5,
    output wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    output supply0 id_9,
    output supply1 id_10,
    input supply0 id_11,
    output wand id_12,
    output wire id_13,
    input wire id_14,
    output supply1 id_15
);
  assign id_6  = 1;
  assign id_10 = id_14 ~^ id_0;
endmodule
module module_1 (
    output tri1  id_0,
    input  tri1  id_1,
    input  wire  id_2,
    output uwire id_3,
    input  wor   id_4,
    output logic id_5,
    output wire  id_6,
    output logic id_7
);
  always @(posedge id_2, posedge 1)
    if (1) id_7 <= #1 1;
    else id_5 <= #1 1'h0;
  module_0(
      id_2, id_2, id_4, id_1, id_6, id_4, id_6, id_2, id_4, id_3, id_0, id_4, id_6, id_3, id_2, id_6
  );
  always force id_5 = 1'b0;
endmodule
