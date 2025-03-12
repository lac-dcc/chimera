// Seed: 3686558040
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input wire id_2,
    input supply0 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri id_8,
    input tri0 id_9,
    input tri1 id_10
);
  parameter id_12 = 1'd0;
  if (1) begin : LABEL_0
    logic [1 : 1] id_13;
    logic id_14;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
