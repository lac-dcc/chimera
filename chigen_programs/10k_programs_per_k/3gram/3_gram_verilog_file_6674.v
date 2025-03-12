// Seed: 3057817862
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input tri0 id_2,
    output logic id_3
);
  logic id_5;
  ;
  always @(posedge id_2) id_3 <= (id_2);
  wire id_6;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wire id_2,
    input supply0 id_3,
    input wire id_4,
    input wor id_5,
    input wand id_6,
    input wire id_7,
    output wor id_8,
    input wire id_9,
    input wor id_10,
    input wor id_11,
    input wire id_12
);
  initial begin : LABEL_0
    id_1 <= id_12;
  end
  and primCall (id_1, id_6, id_10, id_2, id_0, id_9);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_6,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
