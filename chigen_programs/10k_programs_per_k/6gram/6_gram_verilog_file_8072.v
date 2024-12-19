// Seed: 101108778
module module_0 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input wire id_3,
    input wor id_4,
    input supply1 id_5,
    input tri0 id_6
);
  tri0 id_8 = 1;
endmodule
module module_1 (
    output wor id_0,
    output supply1 id_1,
    input wand id_2,
    output wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wand id_6
);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_2,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output supply0 id_5,
    input wor id_6,
    output uwire id_7,
    input logic id_8,
    input tri1 id_9,
    input tri1 id_10,
    output logic id_11
);
  always @(posedge id_10 or negedge id_0 == id_8) begin : LABEL_0
    id_11 <= id_8;
  end
  module_0 modCall_1 (
      id_10,
      id_5,
      id_9,
      id_1,
      id_6,
      id_4,
      id_4
  );
  assign modCall_1.type_9 = 0;
endmodule
