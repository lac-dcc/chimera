// Seed: 3729481839
module module_0 #(
    parameter id_8 = 32'd80,
    parameter id_9 = 32'd86
) (
    input tri id_0,
    output supply1 id_1,
    input tri id_2,
    output supply1 id_3
);
  wor id_5;
  assign id_5 = 1;
  for (id_6 = id_5; 1 || !1; id_1 = 1) begin : LABEL_0
    integer id_7;
    defparam id_8.id_9 = 1;
  end
  id_10(
      .id_0(1), .id_1(1'b0), .id_2(1 + id_1)
  );
endmodule
module module_1 (
    output logic id_0,
    output tri0 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri id_4
);
  supply1 id_6;
  assign {id_4, id_2, 1} = id_6;
  uwire id_7;
  tri0  id_8;
  assign id_8 = id_2;
  assign id_6 = (1) * id_8;
  id_9 :
  assert property (@(posedge 1) id_7 == id_6)
  else;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_3
  );
  assign modCall_1.id_5 = 0;
  always begin : LABEL_0
    id_0 <= 1;
  end
endmodule
