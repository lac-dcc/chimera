// Seed: 3234145435
module module_0 (
    input tri id_0,
    input wor id_1,
    output supply1 id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri0 id_5
);
  logic [-1 : 1 'b0] id_7;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd45
) (
    input wor id_0,
    output supply0 id_1,
    input tri1 _id_2,
    input supply1 id_3
);
  logic [-1 : id_2] id_5, id_6;
  nor primCall (id_1, id_7, id_8, id_6);
  string id_7 = "";
  wire   id_8;
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_5 = 0;
  assign id_8 = id_0;
endmodule
