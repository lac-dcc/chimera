// Seed: 4168751172
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_10;
endmodule
module module_1 #(
    parameter id_1 = 32'd8,
    parameter id_3 = 32'd52
) (
    _id_1,
    id_2,
    _id_3
);
  output wire _id_3;
  input wire id_2;
  inout wire _id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4
  );
  logic [{  id_1  +  1  &  1  {  id_1  }  } : id_3  #  (  .  id_3  (  -1  )  )] id_5;
  ;
endmodule
