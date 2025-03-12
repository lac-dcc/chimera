// Seed: 2227502522
module module_0 #(
    parameter id_5 = 32'd52,
    parameter id_7 = 32'd42
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  logic [7:0][-1 'b0 : -1] id_4;
  wire _id_5;
  logic [7:0] id_6;
  assign id_6[id_5] = 1'd0;
  logic _id_7;
  wire [1 : id_7] id_8;
  assign id_4[id_7] = id_6 || 1 ? -1 == id_5 : id_6;
endmodule
module module_1 #(
    parameter id_5 = 32'd88
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  or primCall (id_4, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  integer [id_5 : 1 'b0] id_6 = -1;
endmodule
