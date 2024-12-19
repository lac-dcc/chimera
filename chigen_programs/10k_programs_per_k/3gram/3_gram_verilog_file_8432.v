// Seed: 3026514716
module module_0 #(
    parameter id_16 = 32'd67,
    parameter id_17 = 32'd29
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
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_16.id_17 = 1;
  assign id_2 = id_8;
  wire id_18 = id_7;
  wire id_19;
  assign module_1.id_7 = 0;
  assign id_6 = 1'b0;
endmodule
module module_1 (
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always
    for (id_5 = 1; id_5; id_1 = id_7)
      @(~1)
        if (1)
          id_7 <= {
            id_6,
            id_5,
            1,
            id_6,
            id_7,
            1,
            {1, 1'b0},
            $display(~id_8, id_5 == id_6, id_6) * 1,
            id_5,
            1
          };
  always @(posedge id_5 or posedge 1'b0);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_3,
      id_12,
      id_13,
      id_8,
      id_13,
      id_12,
      id_12,
      id_10,
      id_10,
      id_2,
      id_10,
      id_8
  );
  assign id_7 = id_7;
endmodule
