// Seed: 1911200288
module module_0 #(
    parameter id_9 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire _id_9;
  wire id_10;
  wire id_11 [{  id_9  {  1  }  } : 1];
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd13
) (
    _id_1,
    id_2,
    id_3
);
  input wire id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2
  );
  inout wire id_2;
  inout wire _id_1;
  wire [-1 'h0 : id_1] id_4;
  id_5(
      id_4, 1, 1
  );
  wire id_6, id_7;
endmodule
