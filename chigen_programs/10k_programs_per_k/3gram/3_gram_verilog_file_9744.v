// Seed: 1875877266
module module_0 (
    input wand id_0,
    input wor id_1,
    input uwire id_2,
    input wire id_3,
    input uwire id_4,
    input tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    output uwire id_8
);
  wire id_10;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1
    , id_12,
    output wor id_2,
    input wire id_3,
    input supply0 id_4,
    output logic id_5,
    input supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wire id_9,
    input tri0 id_10
);
  assign id_5 = 1;
  always @((1) or posedge id_7) begin : LABEL_0
    id_5 <= id_4;
  end
  assign id_12[-1] = id_8;
  always @(id_4 or posedge 1) if (1) id_5 = id_4;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_6,
      id_7,
      id_4,
      id_7,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
