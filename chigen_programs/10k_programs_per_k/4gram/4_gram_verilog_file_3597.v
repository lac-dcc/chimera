// Seed: 1083823047
module module_0 (
    output uwire id_0,
    input tri id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wire id_4,
    input tri0 id_5,
    input uwire id_6,
    input supply0 id_7,
    output logic id_8,
    output wire id_9,
    input wire id_10,
    output uwire id_11,
    input wor id_12,
    input tri0 id_13,
    input wand id_14,
    output wire id_15
);
  wire id_17;
  for (id_18 = -1; 1 + id_13; id_8 = id_10) begin : LABEL_0
    genvar id_19;
  end
  wire id_20;
  assign id_8 = id_17;
endmodule
module module_1 #(
    parameter id_3 = 32'd39
) (
    output logic id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri1 _id_3,
    output tri0 id_4,
    output wor id_5,
    output wire id_6,
    output tri0 id_7,
    input tri1 id_8,
    output supply1 id_9,
    output tri id_10
);
  assign id_4 = id_2;
  wire id_12;
  always @(id_2) begin : LABEL_0
    id_0 <= -1;
    id_0 = id_8;
  end
  wire [id_3  |  id_3 : 1] id_13;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_9,
      id_8,
      id_1,
      id_8,
      id_2,
      id_2,
      id_0,
      id_7,
      id_2,
      id_10,
      id_1,
      id_2,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
