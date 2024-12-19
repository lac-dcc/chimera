// Seed: 2478406354
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    output wand id_4,
    output wor id_5,
    input tri module_0,
    input wand id_7,
    input tri id_8,
    output tri0 id_9
);
  wire id_11;
  assign module_1.type_18 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wire id_4,
    output logic id_5,
    output wire id_6,
    input wor id_7,
    output tri1 id_8,
    input tri1 id_9,
    input uwire id_10,
    input logic id_11,
    input logic id_12
);
  assign id_5 = id_11;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_1,
      id_4,
      id_8,
      id_8,
      id_7,
      id_10,
      id_10,
      id_8
  );
  always #1
    #1
      if (1)
        if (id_1) deassign id_6;
        else id_5 <= 1;
      else id_5 <= id_12;
endmodule
