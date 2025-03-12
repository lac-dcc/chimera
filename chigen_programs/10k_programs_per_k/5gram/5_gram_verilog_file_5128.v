// Seed: 3147206465
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  generate
    assign id_3[-1] = {id_1, id_1};
  endgenerate
endmodule
module module_1 #(
    parameter id_4 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[-1] = 1;
  real [id_4 : (  -1  )] id_5;
  ;
  wire id_6 = ~id_1 == 'b0;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_1,
      id_6
  );
endmodule
