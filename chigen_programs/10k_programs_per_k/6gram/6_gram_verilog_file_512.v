// Seed: 2413501549
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input wire id_5,
    output supply1 id_6,
    output wor id_7,
    input wire id_8,
    input uwire id_9
);
  logic id_11;
  ;
  assign module_1.id_2 = 0;
  uwire id_12 = 1;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    output tri1 id_2,
    input uwire id_3,
    output logic id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wor id_7,
    input wor id_8,
    output supply1 id_9
);
  assign id_4 = id_1 == -1;
  always @(id_7 or posedge id_5) begin : LABEL_0
    #(-1) id_0 = 1'b0;
    id_4 <= -1'b0 != -1;
    id_4 = -1;
  end
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_1,
      id_5,
      id_6,
      id_2,
      id_2,
      id_1,
      id_1
  );
endmodule
