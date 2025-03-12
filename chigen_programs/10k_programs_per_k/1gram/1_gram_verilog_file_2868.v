// Seed: 1443341685
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input supply1 id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5[1 : -1],
    output supply0 id_6,
    output uwire id_7,
    output uwire id_8#(
        .id_18(-1),
        .id_19(1),
        .id_20(1'b0 || {1}),
        .id_21(1 + 1)
    ),
    input wor id_9,
    input supply1 id_10,
    output tri id_11,
    input wor id_12,
    output tri id_13,
    output tri1 id_14,
    output tri1 void id_15,
    output wor id_16
);
  assign module_1.id_2 = 0;
  logic id_22;
endmodule
module module_1 #(
    parameter id_3 = 32'd54
) (
    output wor id_0,
    input uwire id_1[id_3 : SystemTFIdentifier  (  id_3  ,  id_3  &  1  +  -1  )],
    input tri1 id_2[{  id_3  {  -1  }  } : -1 'h0],
    input supply1 _id_3,
    input tri id_4
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
endmodule
