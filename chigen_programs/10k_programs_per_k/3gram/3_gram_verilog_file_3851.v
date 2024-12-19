// Seed: 1368887304
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
endmodule
module module_1 (
    input  tri0 id_0,
    input  wire id_1,
    output tri0 id_2
);
  not primCall (id_2, id_0);
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_6(
      .id_0((id_1)),
      .id_1(id_1),
      .id_2(1),
      .id_3(1'b0 - {-1, 1}),
      .id_4(id_5),
      .id_5(1'h0),
      .id_6(1),
      .id_7(1 ? 1 : id_2),
      .id_8(1)
  ); id_7 :
  assert property (@(posedge id_7) id_1)
  else id_4 = 1'b0;
  assign id_2 = id_7;
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
    id_22,
    id_23,
    id_24,
    id_25
);
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_14[1] = 1;
  module_2 modCall_1 (
      id_21,
      id_9,
      id_19,
      id_9,
      id_23
  );
  wire id_26;
  wire id_27;
  supply0 id_28 = 1;
  assign id_10 = id_17;
endmodule
