// Seed: 1637180436
module module_0;
endmodule
macromodule module_1 #(
    parameter id_14 = 32'd23,
    parameter id_2  = 32'd67
) (
    output tri id_0
    , _id_2
);
  logic [7:0][id_2 : 1]
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
      _id_14,
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
      id_25,
      id_26;
  assign id_8[id_14] = "";
  module_0 modCall_1 ();
  nor primCall (
      id_0,
      id_10,
      id_11,
      id_12,
      id_13,
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
      id_25,
      id_26,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9
  );
  logic id_27;
endmodule
module module_2 (
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
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 ();
  input wire id_2;
  output wire id_1;
  xnor primCall (id_1, id_10, id_11, id_2, id_3, id_5, id_6, id_7, id_8, id_9);
endmodule
