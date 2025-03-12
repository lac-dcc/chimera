// Seed: 3122853640
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input uwire id_5,
    output supply1 id_6
    , id_14,
    input wire id_7,
    input wor id_8,
    output wor id_9,
    output uwire id_10,
    output uwire id_11
    , id_15,
    input tri id_12
);
  wire id_16 = id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd60
) (
    input supply0 id_0,
    output uwire id_1,
    input wand _id_2,
    input supply0 id_3
    , id_7,
    output uwire id_4,
    output supply1 id_5
);
  tri [id_2 : (  -1  )  >=  ~  {  1  ,  -1 'b0 ,  1 'b0 ,  1  }] id_8 = (1);
  assign id_1 = id_2;
  assign id_8 = -1'b0 == -1 ? id_2 == 1 : id_7++;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_0,
      id_3,
      id_5,
      id_4,
      id_5,
      id_3
  );
  wire id_9;
endmodule
