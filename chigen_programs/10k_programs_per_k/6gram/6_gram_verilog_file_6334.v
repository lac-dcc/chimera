// Seed: 2726179326
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    output tri1 id_6,
    output wand id_7,
    input supply0 id_8,
    output wire id_9,
    output logic id_10,
    output wor id_11
);
  always @(*) id_10 = #1 "";
endmodule
module module_1 #(
    parameter id_3 = 32'd45,
    parameter id_4 = 32'd46,
    parameter id_6 = 32'd51
) (
    output wand id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri0 _id_3,
    input tri0 _id_4,
    output logic id_5
    , id_8,
    output supply0 _id_6
);
  logic [(  id_6  -  id_3  ) : id_4  *  id_6  -  -1] id_9 = id_4;
  assign id_9 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
  always @(negedge id_9) id_5 = id_4 - id_3;
  assign id_6 = id_9;
  always force id_5 = id_1;
endmodule
