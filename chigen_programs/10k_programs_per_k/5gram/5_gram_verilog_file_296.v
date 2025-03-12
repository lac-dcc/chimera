// Seed: 4107375971
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    input tri0 id_5,
    output supply0 id_6,
    input tri1 id_7,
    input wor id_8,
    output supply1 id_9,
    input wor id_10,
    output wire id_11,
    output uwire id_12
);
  parameter id_14 = 1;
  assign id_11 = 1;
  assign id_11 = id_3 == -1;
  assign module_1._id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd24
) (
    input  tri1  id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  tri   id_3,
    input  tri   _id_4,
    output uwire id_5
);
  wire [id_4 : 1] id_7, id_8, id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_3,
      id_3,
      id_5,
      id_0,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5
  );
endmodule
