// Seed: 2043696762
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output tri1 id_1;
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd8
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  input wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  uwire [-1 'b0 : 1] id_5;
  assign id_5 = 1;
  assign id_2[-1'b0] = 1 - id_2;
  assign id_5 = ~id_3;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_5,
      id_4,
      id_5,
      id_5
  );
  assign id_1 = id_3;
  assign id_2[id_3-:1] = id_5;
endmodule
