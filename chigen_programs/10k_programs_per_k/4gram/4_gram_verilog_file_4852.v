// Seed: 3900597732
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    input tri id_4,
    input supply0 id_5,
    input tri id_6,
    output wor id_7,
    output uwire id_8,
    output uwire id_9
);
  assign id_8 = -1;
  logic id_11;
  wire [1 'b0 : 1] id_12;
  wire id_13;
  wire [1 : -1] id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_16 = 32'd31,
    parameter id_20 = 32'd28,
    parameter id_21 = 32'd57,
    parameter id_23 = 32'd4,
    parameter id_29 = 32'd71
) (
    input wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    output wire id_3,
    output uwire id_4,
    input wire id_5,
    output logic id_6,
    input tri id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri id_10,
    input tri0 id_11,
    input uwire id_12,
    output wire id_13,
    output tri id_14,
    input tri id_15,
    input wor _id_16,
    output uwire id_17
    , id_28,
    output supply0 id_18,
    output wire id_19,
    output tri _id_20,
    output supply1 _id_21,
    output uwire id_22,
    input wire _id_23,
    input tri id_24,
    input uwire id_25,
    input tri0 id_26
);
  logic [id_20  ==  id_21 : 1] _id_29, id_30;
  module_0 modCall_1 (
      id_24,
      id_14,
      id_12,
      id_2,
      id_26,
      id_12,
      id_0,
      id_18,
      id_4,
      id_3
  );
  assign modCall_1.id_5 = 0;
  wire [id_29  -  id_16 : id_23] id_31;
  always @({1{-1}} + id_25) id_6 <= id_0;
endmodule
