// Seed: 138759015
module module_0 (
    output logic id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3
);
  always id_0 = 1 + id_3 - -1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    output logic id_3
);
  always if ((1)) id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd50
) (
    input supply0 _id_0,
    input wor id_1,
    input wand id_2,
    output tri1 id_3,
    input wand id_4[1 'd0 : id_0],
    input wire id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    input uwire id_9,
    input tri1 id_10,
    output tri id_11,
    output supply1 id_12,
    output logic id_13
);
  assign id_8 = id_2;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_10,
      id_5
  );
  assign modCall_1.id_0 = 0;
  always begin : LABEL_0
    id_13 = id_7;
    id_13 <= 1;
  end
endmodule
