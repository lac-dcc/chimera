// Seed: 3281473570
module module_0 (
    output tri id_0,
    input wire id_1,
    input wire id_2,
    input supply1 id_3,
    output supply0 id_4,
    output supply0 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri1 id_10,
    output supply1 id_11,
    output uwire id_12,
    input wire id_13,
    output uwire id_14,
    output uwire id_15,
    output wor id_16,
    input wand id_17,
    input supply1 id_18,
    input uwire id_19,
    output tri0 id_20
);
  assign id_16 = id_7;
endmodule
module module_1 (
    input  logic id_0,
    output wand  id_1,
    input  tri1  id_2,
    output logic id_3,
    input  logic id_4
);
  reg id_6;
  always
  fork
    id_3 <= id_0;
    #id_7 id_1 = 1;
    begin : LABEL_0
      id_6 <= id_4;
    end
  join
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_12 = 0;
endmodule
