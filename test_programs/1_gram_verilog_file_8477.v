// Seed: 4013068452
module module_0 (
    input tri id_0,
    output supply1 id_1,
    id_13,
    input supply0 id_2,
    input uwire id_3,
    input tri1 id_4,
    input wor id_5,
    output supply1 id_6,
    output uwire id_7,
    output uwire id_8,
    input tri id_9,
    input supply0 id_10,
    output supply1 id_11
);
  assign module_1.type_0 = 0;
  assign id_1 = id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input wor  id_1
);
  uwire id_3 = id_1;
  if (1) begin : LABEL_0
    assign id_4 = id_4[(-1)];
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3
  );
endmodule
