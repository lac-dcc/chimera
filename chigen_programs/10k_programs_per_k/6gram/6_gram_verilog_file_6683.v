// Seed: 2317513215
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
endmodule
module module_1 #(
    parameter id_6 = 32'd61
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  input wire id_5;
  output wire id_4;
  output reg id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  wire id_7 = id_2[id_6 : (id_6)==1];
  wire id_8 = (id_7);
  assign id_3 = -1'b0 + id_6;
  wire id_9;
  always @(id_7 or posedge id_6 - -1) id_3 <= 1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8
  );
endmodule
