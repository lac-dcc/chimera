// Seed: 2885425839
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
    id_13
);
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout tri1 id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1 == $signed(77);
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd4
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout wire id_3;
  input wire _id_2;
  output wire id_1;
  logic id_6;
  logic [1 : id_2] id_7, id_8 = id_3;
  always @(id_6) begin : LABEL_0
    assert (id_8 + id_6);
  end
endmodule
