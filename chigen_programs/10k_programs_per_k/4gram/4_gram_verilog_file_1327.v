// Seed: 111166258
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  wire id_7;
  ;
  assign id_2[-1] = 1;
  logic [1 'b0 : -1] id_8;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  input wire _id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_4,
      id_4,
      id_4,
      id_5
  );
  output wire id_2;
  output wire id_1;
  id_12 :
  assert property (@(posedge id_7) id_6)
  else $clog2(99);
  ;
  wire id_13;
  wire id_14;
  assign id_7[1+:id_6] = id_11;
  wire id_15;
  generate
    logic id_16;
  endgenerate
endmodule
