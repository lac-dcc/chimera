// Seed: 2276003023
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    output supply1 id_3,
    input supply0 id_4
);
  wire id_6;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    output logic id_3,
    output tri1 id_4,
    output tri1 id_5,
    output wor id_6,
    input supply0 id_7,
    output wand id_8,
    input wire id_9,
    input wor id_10,
    output supply0 id_11,
    input wand id_12
);
  always @(id_9) begin : LABEL_0
    #1 begin : LABEL_0
      if (id_9) id_3 <= 1;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_7,
      id_8,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
