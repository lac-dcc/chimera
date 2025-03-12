// Seed: 3314850036
module module_0 (
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_5;
endmodule
module module_1 #(
    parameter id_5 = 32'd97,
    parameter id_6 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7
);
  input wire id_7;
  input wire _id_6;
  input wire _id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2
  );
  initial begin : LABEL_0
    id_1[-1] <= -1;
    #1 id_1[id_5==id_6 : id_5] = -1;
  end
endmodule
