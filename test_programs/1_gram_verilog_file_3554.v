// Seed: 3014086063
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wire id_2,
    output logic id_3,
    input supply0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    input tri id_9,
    input tri0 id_10
);
  wire id_12;
  always_ff begin : LABEL_0
    id_3 <= (id_6 == -1);
  end
  supply0 id_13;
  wor id_14, id_15;
  assign id_13 = id_15 - -1;
  wire id_16;
  parameter id_17 = -1;
  wire id_18;
  wire id_19;
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    input logic id_0,
    input wor id_1,
    output tri0 id_2,
    output logic id_3,
    output logic id_4,
    output tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    input wand id_8,
    output tri0 id_9,
    input wire id_10,
    input wor id_11,
    input wor id_12,
    input supply0 id_13,
    output wor id_14,
    input wor id_15,
    input supply0 id_16,
    output tri1 id_17,
    input uwire id_18,
    input wire id_19,
    input tri id_20,
    output wor id_21,
    output tri1 id_22,
    input supply0 id_23,
    output tri0 id_24
);
  wire id_26;
  module_0 modCall_1 (
      id_19,
      id_10,
      id_8,
      id_3,
      id_8,
      id_2,
      id_20,
      id_8,
      id_15,
      id_18,
      id_18
  );
  assign modCall_1.id_1 = 0;
  always begin : LABEL_0
    if ("") id_4 <= #1 1;
    else id_3 <= id_0;
  end
endmodule
