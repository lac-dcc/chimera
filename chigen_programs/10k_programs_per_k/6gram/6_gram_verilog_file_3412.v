// Seed: 656349411
module module_0 (
    output tri id_0,
    output supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    output wire id_4,
    input supply0 id_5,
    input wor id_6,
    input supply0 id_7,
    output wire id_8,
    output supply1 id_9
);
  assign id_9 = id_7;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input tri id_3,
    input supply1 id_4,
    input wire id_5,
    input wire id_6,
    output uwire id_7,
    output logic id_8,
    input uwire id_9,
    input wor id_10,
    input wor id_11,
    output uwire id_12,
    output uwire id_13,
    input tri id_14,
    output wand id_15
);
  always @(posedge {1 | -1, 1 == id_5} | id_0) begin : LABEL_0
    id_8 <= 1;
  end
  module_0 modCall_1 (
      id_15,
      id_12,
      id_14,
      id_5,
      id_13,
      id_3,
      id_11,
      id_4,
      id_12,
      id_15
  );
endmodule
