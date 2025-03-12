// Seed: 3016243944
module module_0 (
    input wor id_0,
    input tri id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output tri0 id_6
    , id_27,
    input tri0 id_7,
    output tri0 id_8,
    output uwire id_9
    , id_28,
    input wor id_10,
    output wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    input wire id_14,
    output wor id_15,
    input wire id_16,
    input uwire id_17,
    output wire id_18,
    input uwire id_19,
    input uwire id_20,
    input wor id_21,
    output supply0 id_22,
    input supply0 id_23,
    input wand id_24,
    input supply1 id_25
);
  assign module_1.id_5 = 0;
  genvar id_29;
  assign id_28 = id_10;
  always
  `define pp_30 0
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_0 = 32'd11,
    parameter id_3 = 32'd69,
    parameter id_7 = 32'd17
) (
    input supply1 _id_0,
    input uwire id_1,
    output supply0 id_2[id_3 : 1],
    output tri0 _id_3,
    input supply1 id_4,
    output logic id_5
);
  always id_5 <= id_1 & id_4;
  logic _id_7[1 : {  1  ,  id_0  }];
  ;
  wire [id_7 : id_0] id_8, id_9, id_10;
  localparam id_11 = "";
  logic [-1 : 1] id_12;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_4,
      id_1,
      id_2,
      id_4,
      id_4,
      id_1,
      id_2,
      id_4,
      id_1,
      id_1
  );
endmodule
