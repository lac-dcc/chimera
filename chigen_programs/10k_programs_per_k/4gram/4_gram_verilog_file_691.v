// Seed: 2400619876
module module_0 (
    input wand id_0,
    input uwire id_1,
    output uwire id_2,
    output supply0 id_3,
    output wire id_4,
    output wor id_5,
    input tri0 id_6,
    output wand id_7
    , id_17,
    input supply0 id_8,
    input supply1 id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12,
    input wand id_13,
    input supply1 id_14,
    output tri1 id_15
);
  wire id_18;
  ;
  wire id_19;
endmodule
module module_1 #(
    parameter id_6 = 32'd45
) (
    input tri1 id_0,
    output logic id_1,
    input tri id_2,
    output tri id_3,
    input wire id_4,
    input wire id_5,
    input tri0 _id_6,
    output uwire id_7,
    output uwire id_8,
    output tri0 id_9,
    output supply0 id_10
);
  always @(posedge -1) id_1 = {((id_0)), 1};
  wire [id_6 : -1] id_12;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_9,
      id_7,
      id_9,
      id_5,
      id_8,
      id_2,
      id_5,
      id_2,
      id_4,
      id_5,
      id_2,
      id_5,
      id_9
  );
  assign modCall_1.id_11 = 0;
endmodule
