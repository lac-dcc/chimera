// Seed: 1271289206
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input wand id_5,
    output uwire id_6,
    input supply0 id_7
);
  for (id_9 = 1; 1'b0; id_6 = 1) begin : LABEL_0
    wire id_10;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri0 id_2
    , id_14,
    input wire id_3,
    input supply0 id_4,
    input supply0 id_5,
    output tri1 id_6,
    input wor id_7,
    input supply0 id_8,
    output supply0 id_9,
    output wire id_10,
    input uwire id_11,
    output logic id_12
);
  assign id_14[1] = 1 ? 1 : 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_7,
      id_5,
      id_8,
      id_6,
      id_5
  );
  assign modCall_1.type_12 = 0;
  always id_12 <= id_6++;
  always_ff @(negedge id_14) id_10 = 1;
  generate
    wire id_15;
  endgenerate
endmodule
