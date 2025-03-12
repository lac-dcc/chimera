// Seed: 3456220631
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wor id_5,
    output tri1 id_6
);
  localparam id_8 = 1;
endmodule
module module_1 #(
    parameter id_0  = 32'd46,
    parameter id_1  = 32'd86,
    parameter id_12 = 32'd70,
    parameter id_24 = 32'd94,
    parameter id_4  = 32'd45,
    parameter id_9  = 32'd58
) (
    inout supply0 _id_0,
    input tri _id_1,
    output wire id_2,
    output tri0 id_3,
    output wor _id_4,
    input wand id_5,
    output uwire id_6,
    output uwire id_7,
    output tri id_8,
    input supply0 _id_9,
    input tri0 id_10,
    output tri1 id_11,
    output tri0 _id_12,
    output supply1 id_13,
    output wire id_14,
    input tri id_15,
    output tri id_16,
    input tri1 id_17,
    output tri0 id_18,
    output uwire id_19,
    output uwire id_20,
    output tri0 id_21
);
  wire [id_9 : id_4] id_23;
  module_0 modCall_1 (
      id_17,
      id_15,
      id_5,
      id_17,
      id_10,
      id_15,
      id_2
  );
  assign modCall_1.id_3 = 0;
  logic _id_24;
  ;
  wire [1 : id_24  ?  id_0 : id_1] id_25[(  -1  ==  -1  ) : {  id_12  ,  1  }], id_26;
  xor primCall (id_2, id_10, id_17, id_15);
endmodule
