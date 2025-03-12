// Seed: 353646445
module module_0 #(
    parameter id_2 = 32'd96,
    parameter id_4 = 32'd34
) (
    id_1,
    _id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  inout wire _id_2;
  output wire id_1;
  wire [-1 : {  1  ,  1  ,  id_4  ==  id_2  }] id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output supply0 id_2;
  inout wire id_1;
  assign #id_5 id_1 = id_4;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_3,
      id_5
  );
  assign id_2 = 1;
endmodule
