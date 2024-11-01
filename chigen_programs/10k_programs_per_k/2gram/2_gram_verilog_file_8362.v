// Seed: 3690141605
module module_0 #(
    parameter id_18 = 32'd12,
    parameter id_19 = 32'd86
) (
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
    id_15
);
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_16 = 'b0;
  id_17(
      id_12
  ); defparam id_18.id_19 = 1;
  assign id_7 = 1 - "";
  wire id_20;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_9(
      1'h0
  );
  wire id_10;
  xnor (id_2, id_4, id_8, id_10);
  assign id_2 = 1;
  module_0(
      id_2, id_6, id_10, id_9, id_9, id_8, id_7, id_10, id_2, id_10, id_10, id_4, id_2, id_10, id_9
  );
endmodule
