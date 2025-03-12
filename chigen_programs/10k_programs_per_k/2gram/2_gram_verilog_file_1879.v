// Seed: 4117720988
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input supply1 id_2
);
  wire id_4;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wire id_2,
    output tri id_3,
    output tri1 id_4,
    input wor id_5,
    output tri id_6,
    input supply1 id_7,
    input wand id_8
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd25,
    parameter id_7 = 32'd44
) (
    input uwire _id_0,
    input tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wand id_6,
    input tri1 _id_7,
    input wire id_8,
    input supply0 id_9,
    output tri0 id_10,
    output supply1 id_11,
    output logic id_12,
    input uwire id_13,
    input wor id_14,
    input tri1 id_15,
    input tri0 id_16,
    output wor id_17
);
  wire [id_0  |  ~  id_7 : -1] id_19;
  module_0 modCall_1 (
      id_5,
      id_17,
      id_14
  );
  assign modCall_1.id_2 = 0;
  wire id_20;
  ;
  always_ff begin : LABEL_0
    id_12 <= 1'h0;
  end
endmodule
