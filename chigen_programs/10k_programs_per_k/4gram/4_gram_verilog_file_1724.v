// Seed: 1881910181
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  wire id_10;
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2 #(
    parameter id_21 = 32'd19,
    parameter id_22 = 32'd96
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
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_11 & 1;
  module_0(
      id_4, id_17
  );
  for (id_19 = 1; 1; id_8 = 1) begin : id_20
    defparam id_21.id_22 = ~id_1;
  end
  and (id_17, id_2, id_9, id_16, id_13, id_11, id_8, id_1, id_10, id_14, id_18, id_7, id_6);
  assign id_17 = id_19;
endmodule
