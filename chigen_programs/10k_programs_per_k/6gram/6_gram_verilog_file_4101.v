// Seed: 1203180303
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output supply1 id_2,
    output supply0 id_3
);
  wire id_5;
  always begin : LABEL_0
    $clog2(28);
    ;
  end
endmodule
module module_1 #(
    parameter id_10 = 32'd90
) (
    input tri0 id_0,
    output tri id_1,
    input tri id_2,
    input wor id_3
    , _id_10,
    input tri0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input supply1 id_7,
    output logic id_8
);
  wire [-1 'h0 : id_10] id_11, id_12;
  xnor primCall (id_1, id_12, id_0, id_11, id_13, id_3, id_6, id_2);
  wire id_13;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_1
  );
  assign modCall_1.id_2 = 0;
  initial id_8 = id_10;
endmodule
