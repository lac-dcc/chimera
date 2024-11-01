// Seed: 2440612701
macromodule module_0 (
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
    id_13
);
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14;
endmodule
module module_1 #(
    parameter id_27 = 32'd69,
    parameter id_28 = 32'd17
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
    id_12#(id_13, (1), 1, 1, id_14[1], id_15),
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_25(
      .id_0(), .id_1(id_19), .id_2(), .id_3(1), .id_4(1), .id_5(~1), .id_6(id_4)
  );
  assign id_18 = 1 == "";
  for (id_26 = 1; 1'b0; id_22 = 1) begin
    defparam id_27.id_28 = id_28;
    tri0 id_29 = 1;
  end
  module_0(
      id_24, id_11, id_22, id_11, id_12, id_23, id_17, id_22, id_22, id_24, id_18, id_8, id_7
  );
endmodule
