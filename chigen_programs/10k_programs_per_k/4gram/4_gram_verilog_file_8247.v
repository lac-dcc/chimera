// Seed: 1115894232
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_6 = -1'd0;
  struct packed {logic id_7;} id_8 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd87,
    parameter id_4 = 32'd99
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  output wire _id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  logic [id_4 : id_3] id_6;
  always @(posedge id_6) id_6 = id_4;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_1,
      id_5
  );
endmodule
