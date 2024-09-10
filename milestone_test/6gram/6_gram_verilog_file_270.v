// Seed: 2325646431
module module_0 #(
    parameter id_21 = 32'd41,
    parameter id_22 = 32'd65,
    parameter id_4  = 32'd89,
    parameter id_8  = 32'd44
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output id_5;
  output _id_4;
  input id_3;
  output id_2;
  input id_1;
  logic
      id_6,
      id_7,
      _id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      _id_21,
      _id_22,
      id_23,
      id_24,
      id_25,
      id_26;
  assign  id_24  =  id_12  ?  id_10  :  id_19  ?  id_13  :  1  ?  ~  id_4  [  (  1 'b0 )  ]  :  id_13  &  1 'h0 ?  id_16  [  1  ]  :  id_6  [  id_22  +  id_4  ]  ;
  assign id_19[id_8] = id_10;
  type_32(
      1, 1, 1, id_14
  ); defparam id_27.id_28 = id_10[id_21];
  assign id_17 = id_14 + id_18;
  assign id_14 = id_13 ? id_23 : 1;
  logic id_29;
  type_34 id_30 (
      .id_0 (id_28),
      .id_1 (1'b0),
      .id_2 (1'h0),
      .id_3 (1),
      .id_4 (id_3),
      .id_5 (id_18),
      .id_6 (id_8[id_4]),
      .id_7 (id_29),
      .id_8 (id_10),
      .id_9 (id_4),
      .id_10(1)
  );
endmodule
