// Seed: 797299958
module module_0 (
    output wand id_0,
    input wire id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output tri id_5
);
  assign id_5 = id_4;
endmodule
module module_1 #(
    parameter id_2 = 32'd73
) (
    output logic id_0,
    input uwire id_1,
    input wire _id_2,
    output wire id_3,
    output supply1 id_4,
    output wire id_5,
    input wire id_6,
    input wor id_7,
    output tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_6,
      id_3
  );
  assign modCall_1.id_0 = 0;
  logic [id_2 : -1] id_11 = id_1;
  wire id_12;
  always @(id_10) begin : LABEL_0
    if (1) begin : LABEL_1
      if (-1 && 1'b0) assert (id_7);
    end else begin : LABEL_2
      id_0 = 1;
    end
  end
endmodule
