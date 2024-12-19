// Seed: 984419101
module module_0 (
    output supply1 id_0,
    output tri id_1,
    output wand id_2,
    output supply1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    output tri id_9,
    input wand id_10,
    output supply1 id_11
);
  wand id_13;
  id_14 :
  assert property (@(posedge id_13) 1) begin : LABEL_0
    id_9  = 1;
    id_14 = 1;
  end
  wire id_15;
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4
);
  always begin : LABEL_0
    id_1 = {(1) {1}};
    #1 id_0 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_4,
      id_3,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
