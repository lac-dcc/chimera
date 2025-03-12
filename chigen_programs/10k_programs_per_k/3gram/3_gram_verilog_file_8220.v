// Seed: 641356461
macromodule module_0 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri1 id_3
    , id_12,
    output supply0 id_4,
    input tri0 id_5,
    input wire id_6,
    output wire id_7,
    input wor id_8,
    input supply1 id_9,
    output wire id_10
);
  wire id_13;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wire id_2,
    output logic id_3,
    input uwire id_4,
    output supply0 id_5
);
  always @(posedge id_4 >= -1) begin : LABEL_0
    id_3 <= -1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_5,
      id_2,
      id_4,
      id_5,
      id_2,
      id_1,
      id_5
  );
  assign modCall_1.id_0 = 0;
  always disable id_7;
endmodule
