// Seed: 43983551
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10 = 1;
  assign id_8 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd31,
    parameter id_15 = 32'd62
) (
    input wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wand id_3,
    output supply1 id_4,
    output uwire id_5,
    input wand id_6,
    input wand id_7,
    input uwire id_8,
    input uwire id_9,
    output wor id_10
);
  wire id_12;
  wire id_13;
  assign id_1 = (1'h0) < id_9;
  xor primCall (id_1, id_12, id_2, id_0, id_9, id_8, id_14, id_7, id_15, id_6, id_13);
  defparam id_14.id_15 = 1;
  module_0 modCall_1 (
      id_13,
      id_12,
      id_12,
      id_12,
      id_13,
      id_12,
      id_13,
      id_12,
      id_12
  );
endmodule
