// Seed: 906702661
module module_0 (
    input wor id_0,
    input uwire id_1,
    output tri id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply0 id_5
    , id_12,
    output wire id_6,
    output logic id_7,
    input tri0 id_8,
    input tri id_9,
    input wand id_10
);
  always @(posedge 1) begin : LABEL_0
    if (id_4)
      if ("") id_7 <= id_12;
      else id_12 = id_3 + id_5;
  end
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri id_2,
    output supply0 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input uwire id_7,
    output supply1 id_8,
    input tri0 id_9,
    output uwire id_10,
    output wor id_11,
    output wor id_12,
    input supply1 id_13,
    input tri1 id_14,
    input wire id_15,
    input logic id_16
    , id_35,
    input wor id_17,
    output logic id_18,
    output wire id_19,
    input uwire id_20,
    input uwire id_21,
    input wor id_22,
    output logic id_23,
    input supply0 id_24,
    input supply0 id_25,
    input wand id_26,
    input supply1 id_27,
    input supply1 id_28,
    output wor id_29,
    input tri id_30,
    input supply0 id_31,
    input wand id_32,
    output uwire id_33
);
  initial
    if (id_17) id_23 <= id_16;
    else id_18 <= 1;
  xnor primCall (
      id_19,
      id_15,
      id_32,
      id_21,
      id_24,
      id_27,
      id_20,
      id_1,
      id_35,
      id_25,
      id_28,
      id_6,
      id_14,
      id_30,
      id_5,
      id_31,
      id_4,
      id_13,
      id_0,
      id_16,
      id_22,
      id_9,
      id_17
  );
  module_0 modCall_1 (
      id_4,
      id_27,
      id_2,
      id_32,
      id_24,
      id_24,
      id_10,
      id_23,
      id_32,
      id_9,
      id_26
  );
endmodule
