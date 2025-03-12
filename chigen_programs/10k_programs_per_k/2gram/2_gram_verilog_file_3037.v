// Seed: 467912279
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    input wand id_8,
    input tri0 id_9,
    output logic id_10
);
  wire id_12;
  wire id_13;
  always_latch id_10 <= id_4;
  wire id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_9 = 32'd50
) (
    input supply1 id_0,
    input uwire id_1,
    output wand id_2,
    input wor id_3,
    input tri0 id_4,
    output logic id_5,
    output supply0 id_6,
    input wand id_7,
    output wire id_8,
    input supply0 _id_9,
    output tri1 id_10
);
  for (id_12 = 1; -1; id_5 = id_3) begin : LABEL_0
    assign id_10 = -1;
    wire [id_9 : 1] id_13;
  end
  always begin : LABEL_1
    `define pp_14 0
  end
  genvar id_15;
  always id_12 = ~1;
  parameter id_16 = 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_2,
      id_4,
      id_7,
      id_7,
      id_3,
      id_1,
      id_3,
      id_7,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
