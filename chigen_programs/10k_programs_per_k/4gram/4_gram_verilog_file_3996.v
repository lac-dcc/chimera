// Seed: 2052407536
module module_0 #(
    parameter id_4 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  ;
  logic [-1  <<  id_4 : -1] id_6;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd89
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  logic id_5;
  ;
  localparam id_6 = 1;
  final $clog2(id_6);
  ;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_6
  );
  wire id_7;
  wire id_8;
  always @* begin : LABEL_0
    disable id_9;
  end
  assign id_2[id_6] = 1;
endmodule
