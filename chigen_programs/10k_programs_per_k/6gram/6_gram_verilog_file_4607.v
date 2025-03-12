// Seed: 1118989510
module module_0 (
    input  wor  id_0,
    output wire id_1,
    output tri0 id_2
);
  assign id_1 = id_0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    input supply1 id_7,
    output wor id_8,
    output logic id_9
);
  generate
    for (genvar id_11 = -1; -1'b0; id_9 = id_11 == -1'b0) begin : LABEL_0
      assign id_8 = !id_4;
    end
  endgenerate
  buf primCall (id_8, id_6);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_8
  );
  assign modCall_1.id_2 = 0;
endmodule
