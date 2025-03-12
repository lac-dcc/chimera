// Seed: 3937281411
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_7;
endmodule
module module_1 #(
    parameter id_3 = 32'd57
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  output reg id_5;
  input wire id_4;
  input wire _id_3;
  inout reg id_2;
  inout tri id_1;
  parameter id_6 = -1;
  parameter id_7 = 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_7,
      id_1,
      id_4
  );
  always begin : LABEL_0
    id_5 <= 1;
    return id_7;
    id_2 = 1'b0;
    #1 if (id_6[-1] & ~id_6 == -1) release id_5;
  end
  parameter [1 : id_3] id_8 = id_6;
  assign id_1 = id_1 - {1 - id_6};
endmodule
