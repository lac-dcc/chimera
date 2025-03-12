// Seed: 2386547730
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd51,
    parameter id_2 = 32'd21
) (
    _id_1,
    _id_2
);
  inout wire _id_2;
  output wire _id_1;
  logic [id_2 : id_1] id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd53
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  input wire _id_5;
  input logic [7:0] id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_1
  );
  input wire id_2;
  inout wire id_1;
  assign id_8[id_5] = id_4[1];
  generate
    assign id_8[-1'b0] = 1'b0;
  endgenerate
endmodule
