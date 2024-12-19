// Seed: 1152558833
module module_0 (
    input uwire id_0,
    input wire id_1,
    output uwire id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input wire id_7,
    output uwire id_8,
    output wor id_9,
    input tri0 id_10,
    input wor id_11,
    output uwire id_12,
    input tri1 id_13,
    input wor id_14,
    output supply0 id_15
);
  assign id_4 = id_6 == id_3;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    input wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    output tri0 id_6,
    output wire id_7,
    input wand id_8,
    input supply0 id_9,
    input supply1 id_10,
    input uwire id_11,
    input wand id_12,
    input wor id_13,
    input tri0 id_14,
    input uwire id_15,
    output wand id_16,
    input wand id_17,
    output tri id_18,
    output tri0 id_19,
    input wire id_20,
    input supply0 id_21,
    output logic id_22,
    output uwire id_23,
    output logic id_24
);
  wand id_26, id_27;
  supply0 id_28 = id_9;
  assign id_26 = 1;
  wire id_29;
  always @(posedge id_14) begin : LABEL_0
    if (id_17#(.id_4(1 % 1'h0)))
      if (1) id_24 <= #1 1;
      else id_22 <= 1;
  end
  module_0 modCall_1 (
      id_8,
      id_5,
      id_28,
      id_20,
      id_18,
      id_2,
      id_3,
      id_17,
      id_19,
      id_19,
      id_5,
      id_13,
      id_19,
      id_5,
      id_5,
      id_1
  );
endmodule
