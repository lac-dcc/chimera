// Seed: 3662684928
module module_0 (
    output wor id_0,
    input tri id_1,
    output wire id_2,
    input wire id_3,
    input tri1 id_4,
    input wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9,
    input tri id_10,
    input tri0 id_11,
    input tri1 id_12
);
  always @(id_7 or id_10) id_2 = id_10;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    input wire id_3
);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3
  );
  always @(posedge id_2) begin : LABEL_0
    return id_2;
  end
endmodule
