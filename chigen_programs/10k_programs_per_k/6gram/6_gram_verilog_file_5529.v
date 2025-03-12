// Seed: 1120933070
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    input wor id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply0 id_8,
    input tri id_9,
    output tri1 id_10
);
  assign id_2 = id_6;
endmodule
module module_1 #(
    parameter id_8 = 32'd97
) (
    input tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply0 id_3,
    input tri id_4
    , id_14,
    input tri id_5,
    input uwire id_6,
    input uwire id_7,
    input tri0 _id_8,
    input supply1 id_9,
    output wire id_10,
    input supply1 id_11,
    output tri id_12
);
  wire id_15;
  assign id_10 = id_15 >= -1;
  always @(posedge id_2 or posedge ~1) begin : LABEL_0
    id_14[id_8] <= -1;
  end
  module_0 modCall_1 (
      id_7,
      id_3,
      id_12,
      id_12,
      id_4,
      id_9,
      id_5,
      id_12,
      id_3,
      id_2,
      id_10
  );
  assign modCall_1.id_5 = 0;
endmodule
