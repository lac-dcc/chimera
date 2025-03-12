// Seed: 3754380129
module module_0 (
    output wand id_0,
    input wor id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output wand id_9,
    input wand id_10,
    input supply1 id_11,
    input tri id_12,
    output wand id_13,
    output uwire id_14,
    input supply0 id_15,
    output supply0 id_16,
    input tri id_17
);
  assign id_16 = -1;
  wand id_19 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd99
) (
    output wand id_0,
    input supply0 id_1,
    input wire _id_2,
    output logic id_3,
    input tri1 id_4
);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_19 = 0;
  always @(posedge -1 or id_2) begin : LABEL_0
    if (-1)
      if (1 == 1'b0) disable id_6;
      else id_3 <= #1 1;
  end
  wire [id_2 : ""] id_7;
endmodule
