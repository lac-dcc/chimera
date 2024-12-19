// Seed: 1830494719
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output wire id_3,
    input wand id_4,
    output wand id_5,
    input tri id_6,
    input wand id_7,
    input wor id_8,
    output uwire id_9,
    output wire id_10,
    output wand id_11
);
  assign module_1.id_3 = 0;
  wire id_13;
endmodule
module module_1 (
    input wor id_0,
    input logic id_1,
    input supply0 id_2,
    output wire id_3,
    output supply0 id_4,
    output logic id_5,
    input wor id_6,
    input tri0 id_7,
    input supply1 id_8,
    output tri id_9,
    input supply1 id_10,
    input wor id_11
);
  always @(id_7 or posedge id_0) begin : LABEL_0
    id_5 <= id_1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_9,
      id_6,
      id_4,
      id_11,
      id_7,
      id_11,
      id_9,
      id_9,
      id_4
  );
endmodule
