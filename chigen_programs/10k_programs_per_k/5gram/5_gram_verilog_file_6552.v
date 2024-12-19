// Seed: 628794645
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5,
    input wand id_6,
    output supply1 id_7,
    input tri0 id_8,
    output uwire id_9,
    output wor id_10,
    input wor id_11
);
  wire id_13;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input logic id_1,
    input supply1 id_2,
    output logic id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wor module_1
);
  supply1 id_9;
  reg id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_4,
      id_5,
      id_4,
      id_2,
      id_4,
      id_4,
      id_0
  );
  always @(*) begin : LABEL_0
    id_3 <= 1'b0;
    if ("") id_10 <= #id_0 id_1;
  end
  assign id_10 = !id_9;
endmodule
