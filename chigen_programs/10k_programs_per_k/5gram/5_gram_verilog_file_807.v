// Seed: 3768871087
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4 = 1 == id_3;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  not primCall (id_2, id_3);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  assign id_2 = 1;
endmodule
module module_2 ();
  integer id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_5 = 0;
  wire id_3;
  assign id_1[1] = id_3;
  wire id_4;
  wire id_5;
endmodule
module module_3 (
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
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_23;
  assign id_10 = 1;
  nor primCall (
      id_3,
      id_19,
      id_25,
      id_20,
      id_6,
      id_23,
      id_18,
      id_9,
      id_10,
      id_12,
      id_24,
      id_1,
      id_21,
      id_14,
      id_2,
      id_4,
      id_8,
      id_5,
      id_17
  );
  wire  id_24;
  uwire id_25 = 1'd0;
  assign id_12#(
      .id_18(1'h0),
      .id_12(""),
      .id_19(1),
      .id_8 ((id_6)),
      .id_5 (1)
  ) [1] = (1);
  module_0 modCall_1 (
      id_21,
      id_10,
      id_3
  );
  assign modCall_1.id_3 = 0;
  wire id_26;
  id_27(
      .id_0(1),
      .id_1(1),
      .id_2(1'b0 <= id_8 | id_14),
      .id_3(id_18),
      .id_4(id_24),
      .id_5(id_24),
      .id_6(id_25),
      .id_7(1'b0)
  );
endmodule
