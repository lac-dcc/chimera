// Seed: 465355524
macromodule module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    input tri id_4,
    input wor id_5,
    output supply1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input wand id_11,
    input tri1 id_12,
    input supply1 id_13
);
  always begin : LABEL_0
    @(posedge id_10 or posedge id_11 - id_8);
    $display(-1);
  end
  assign id_6 = 1;
  assign id_6 = 1;
  assign id_0 = id_3;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input uwire id_2,
    output wor id_3,
    output wire id_4,
    input wor id_5,
    output logic id_6,
    output wor id_7,
    output tri0 id_8,
    output tri1 id_9,
    input wand id_10,
    input supply0 id_11,
    input wire id_12,
    input wire id_13
);
  reg id_15, id_16 = id_16, id_17, id_18;
  always id_6 <= {id_15};
  module_0 modCall_1 (
      id_4,
      id_9,
      id_10,
      id_2,
      id_2,
      id_13,
      id_4,
      id_7,
      id_11,
      id_0,
      id_5,
      id_5,
      id_1,
      id_12
  );
  assign modCall_1.id_5 = 0;
endmodule
