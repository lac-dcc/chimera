// Seed: 3246576578
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input wire id_5,
    input wand id_6
);
  for (id_8 = id_2; id_8; id_8 = id_6) begin : LABEL_0
    wire id_9;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd17
) (
    output tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wor id_6,
    output wor id_7,
    input wire id_8,
    input tri1 id_9,
    input wand id_10,
    input uwire id_11,
    output tri0 _id_12,
    output wor id_13,
    output logic id_14
);
  initial begin : LABEL_0
    if (~1) disable id_16;
    else id_14 = "";
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6
  );
  logic [id_12 : -1] id_17;
  ;
  assign id_0 = 1'b0;
endmodule
