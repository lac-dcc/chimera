// Seed: 3533261897
module module_0 (
    input wire id_0,
    input wand id_1,
    input tri0 id_2,
    input wand id_3,
    input tri1 id_4,
    output tri0 id_5,
    output supply1 id_6,
    input wire id_7
);
  assign id_5 = id_2 ? 1 : 1 == id_1;
  generate
    assign id_5 = 'b0;
  endgenerate
  wire id_9;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    output uwire id_2,
    input uwire id_3,
    input tri id_4,
    input tri id_5,
    output wire id_6,
    output tri0 id_7,
    input supply0 id_8,
    input wand id_9,
    input supply0 id_10,
    input tri0 id_11,
    output logic id_12,
    input wor id_13
);
  initial begin : LABEL_0
    id_12 <= -1;
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_9,
      id_5,
      id_2,
      id_6,
      id_13
  );
  assign modCall_1.id_3 = 0;
endmodule
