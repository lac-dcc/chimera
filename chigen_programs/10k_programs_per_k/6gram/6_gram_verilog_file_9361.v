// Seed: 3778784398
module module_0 (
    input wire id_0,
    input uwire id_1,
    input tri id_2,
    input wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    output tri0 id_9,
    output tri0 id_10
    , id_20,
    output tri0 id_11,
    input wor id_12,
    input wand id_13,
    input tri0 id_14,
    input wire id_15,
    output wor id_16,
    input wor id_17,
    output wand id_18
);
  assign id_10 = -1;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    output uwire id_2,
    output supply0 id_3,
    inout wire id_4,
    input wand id_5,
    input tri0 id_6,
    output tri id_7,
    input tri id_8,
    input wor id_9,
    input tri1 id_10
    , id_13,
    input supply1 id_11
);
  parameter id_14 = -1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_2,
      id_6,
      id_5,
      id_4,
      id_2,
      id_0,
      id_3,
      id_4,
      id_1,
      id_11,
      id_4,
      id_4,
      id_1,
      id_4
  );
  always @(id_11 or posedge id_8 - id_14) begin : LABEL_0
    id_13 <= 1'b0;
  end
endmodule
