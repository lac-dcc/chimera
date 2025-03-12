// Seed: 2556613232
module module_0 ();
  wire [1 : 1] id_1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1 #(
    parameter id_5 = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  input logic [7:0] id_4;
  module_0 modCall_1 ();
  output logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_3[id_5] <= id_4[id_5 : 1];
    id_3[(id_5)|-1 :-1] = id_5;
  end
  assign id_1 = id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_6;
  ;
endmodule
