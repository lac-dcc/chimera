// Seed: 699601915
module module_0 (
    input wor id_0,
    output uwire id_1,
    output wire id_2,
    input wire id_3,
    output wand id_4,
    input uwire id_5,
    input wire id_6,
    input supply0 id_7,
    output tri1 id_8,
    input tri1 id_9,
    input tri1 id_10,
    input tri id_11
);
  assign id_1 = 1'b0;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd79,
    parameter id_14 = 32'd61,
    parameter id_3  = 32'd28
) (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 _id_3,
    input wor id_4,
    output supply0 id_5,
    output tri0 id_6,
    input supply1 id_7,
    output wire id_8,
    output logic id_9,
    input supply1 _id_10,
    output tri1 id_11,
    output tri id_12,
    input tri0 id_13,
    output wand _id_14,
    output supply1 id_15,
    input tri1 id_16,
    input wor id_17
    , id_20,
    output uwire id_18
);
  integer ["" : {  {  id_10  ,  id_14  -  1  }  {  id_3  }  }] id_21;
  ;
  module_0 modCall_1 (
      id_4,
      id_18,
      id_6,
      id_4,
      id_15,
      id_13,
      id_4,
      id_7,
      id_12,
      id_2,
      id_13,
      id_17
  );
  always @(id_4 or posedge 1) id_9 = id_20 == id_17;
endmodule
