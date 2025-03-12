// Seed: 3292454376
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    module_0
);
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  assign module_1.id_7 = 0;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  output tri id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_6 = -1'h0;
  parameter id_7 = (id_6);
  assign id_4 = {-1{{-1, id_1}}};
  bit id_8;
  assign id_5[1] = 1;
  parameter id_9 = id_6;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_2,
      id_9,
      id_6,
      id_6,
      id_6,
      id_1
  );
  wire [(  id_7  )  <  -1 : -1 'b0] id_10;
  initial begin : LABEL_0
    $clog2(id_7);
    ;
    id_8 = 1;
  end
endmodule
