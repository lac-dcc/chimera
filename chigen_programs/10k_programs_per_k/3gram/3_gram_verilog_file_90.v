// Seed: 3073828194
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
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
  assign id_3 = id_9;
  id_10(
      .id_0(1), .id_1(id_2), .id_2(1'h0 ^ 1), .id_3(id_8)
  );
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  nor (
      id_18, id_19, id_13, id_8, id_11, id_6, id_5, id_16, id_20, id_21, id_10, id_14, id_15, id_22
  );
  wire id_21;
  id_22(
      .id_0(1), .id_1(id_6), .id_2(id_10), .id_3(), .id_4(!1), .id_5(1'b0), .id_6(id_18)
  ); module_0(
      id_20, id_11, id_20, id_10, id_15, id_2, id_11, id_13, id_19
  );
  wire id_23;
  wire id_24;
  wire id_25;
  rnmos (1'd0, (id_15) % 1);
endmodule
