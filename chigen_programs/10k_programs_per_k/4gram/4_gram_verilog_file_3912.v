// Seed: 2208875441
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3
    , id_10,
    output tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wire id_8
);
  assign id_4 = id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd97,
    parameter id_9 = 32'd7
) (
    input supply1 _id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri1 id_3,
    output logic id_4,
    input supply0 id_5,
    input tri id_6,
    input wor id_7,
    input uwire id_8,
    input wand _id_9,
    output supply0 id_10,
    input wor id_11,
    input wand id_12,
    input supply1 id_13,
    output supply1 id_14,
    input tri1 id_15,
    input uwire id_16,
    input supply1 id_17,
    input tri0 id_18,
    input supply0 id_19,
    input wire id_20
);
  initial begin : LABEL_0
    $unsigned(61);
    ;
    id_4 <= #1  (id_9);
  end
  logic [-1 : 1 'b0] id_22 = id_20;
  module_0 modCall_1 (
      id_20,
      id_12,
      id_20,
      id_8,
      id_3,
      id_5,
      id_5,
      id_8,
      id_20
  );
  assign modCall_1.id_2 = 0;
  wire [id_0 : id_9] id_23;
endmodule
