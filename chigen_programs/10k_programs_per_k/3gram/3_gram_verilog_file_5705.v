// Seed: 2502930488
module module_0 (
    input wand  id_0,
    input uwire id_1
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wand id_3,
    output supply1 id_4,
    output tri0 id_5
);
  wire id_7 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_1  = 32'd5,
    parameter id_11 = 32'd57
) (
    input supply0 id_0,
    input supply1 _id_1,
    output tri0 id_2,
    input tri id_3,
    output tri id_4,
    output supply0 id_5,
    output logic id_6,
    output tri0 id_7,
    input uwire id_8,
    input wand id_9,
    input supply0 id_10,
    input supply1 _id_11,
    input tri0 id_12,
    output tri1 id_13,
    input tri id_14,
    output logic id_15,
    input wor id_16,
    input wor id_17,
    input tri0 id_18,
    output wor id_19,
    input supply1 id_20,
    input supply1 id_21,
    input uwire id_22,
    input wand id_23,
    output supply0 id_24,
    input supply1 id_25
);
  logic [id_1 : id_11] id_27;
  always @(id_22 or posedge 1) begin : LABEL_0
    #1 $signed(23);
    ;
    id_15 <= id_20;
    id_6  <= id_8 - 1;
  end
  module_0 modCall_1 (
      id_22,
      id_9
  );
endmodule
