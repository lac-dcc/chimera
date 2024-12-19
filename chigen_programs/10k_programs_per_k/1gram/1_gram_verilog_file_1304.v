// Seed: 343586200
module module_0 #(
    parameter id_17 = 32'd22,
    parameter id_18 = 32'd94
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    wire id_11;
    assign id_11 = id_7;
    wire id_12, id_13, id_14, id_15;
    wire id_16;
    assign id_2 = id_15;
  endgenerate
  defparam id_17 = 1, id_18 = 1;
  assign module_1.id_0 = 0;
  tri id_19 = 1;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input uwire id_2
);
  assign #1 id_0 = id_2;
  assign id_0 = 1;
  tri id_4;
  initial $display;
  id_5 :
  assert property (@(*) id_5 - 1) if (id_4);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5
  );
endmodule
