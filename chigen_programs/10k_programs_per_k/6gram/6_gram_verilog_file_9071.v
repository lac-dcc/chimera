// Seed: 928883238
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output tri id_2,
    input tri id_3,
    input wand id_4
);
  reg id_6;
  initial begin : LABEL_0
    id_6 <= 1;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input supply1 id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri id_5,
    inout tri1 id_6,
    input supply1 id_7,
    output wor id_8,
    input logic id_9
);
  always @(*) begin : LABEL_0
    id_1 <= id_9;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_7,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
