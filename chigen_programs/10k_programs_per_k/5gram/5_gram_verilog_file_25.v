// Seed: 1715408889
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_6 = 32'd23
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
    id_10
);
  inout logic [7:0] id_10;
  inout tri id_9;
  inout logic [7:0] id_8;
  inout wire id_7;
  inout wire _id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
  ;
  wire id_12;
  assign id_3 = id_8[id_6 :-1'b0];
  assign id_9 = -1;
  assign id_10[1] = id_12#(
      .id_7(1),
      .id_4(-1)
  );
  or primCall (id_10, id_7, id_1, id_12, id_4, id_11, id_3, id_8, id_5, id_9);
  module_0 modCall_1 (
      id_12,
      id_7,
      id_7
  );
  logic id_13;
endmodule
