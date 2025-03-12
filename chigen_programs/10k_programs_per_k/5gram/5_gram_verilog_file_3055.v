// Seed: 3443037248
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_19 = -1'b0;
  wire id_20;
endmodule
module module_1 #(
    parameter id_3 = 32'd4,
    parameter id_7 = 32'd71
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  output logic [7:0] id_9;
  output wire id_8;
  input wire _id_7;
  output logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire _id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_8,
      id_4,
      id_8,
      id_5,
      id_2,
      id_2,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_2,
      id_5
  );
  assign id_3 = id_7;
  wire [(  -1  ) : 1] id_10;
  assign id_6[id_3] = 1;
  wire id_11;
  id_12 :
  assert property (@(posedge id_12) (id_5))
  else $clog2(id_3);
  ;
  assign id_8 = id_12[-1];
endmodule
