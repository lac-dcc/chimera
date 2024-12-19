// Seed: 2357991031
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4
    , id_18,
    input tri0 id_5,
    output tri1 id_6,
    input wor id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10,
    input tri1 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri id_14,
    input wor id_15,
    output tri1 id_16
);
  assign id_6 = ~id_14;
  assign id_4 = id_5;
  wire id_19;
  supply1 id_20 = id_15;
  assign module_1.type_6 = 0;
  wire id_21;
  assign id_0 = 1;
  wire id_22;
  wire id_23;
  supply0 id_24 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    input  tri   id_2,
    output wire  id_3
);
  initial begin : LABEL_0
    id_1 <= 1;
    if (id_2) #1;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3
  );
endmodule
