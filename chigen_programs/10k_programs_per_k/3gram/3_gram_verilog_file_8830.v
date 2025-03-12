// Seed: 1519312220
module module_0 (
    id_1,
    id_2
);
  inout tri0 id_2;
  input wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_4,
      id_5
  );
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic [1 : (  1  )] id_8;
  ;
endmodule
module module_2 #(
    parameter id_2 = 32'd66
) (
    output supply0 id_0,
    input  uwire   id_1,
    input  uwire   _id_2
);
  reg id_4;
  integer [-1 : id_2] id_5;
  assign id_0 = -1'b0;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  always @(posedge -1) id_4 = 1;
endmodule
