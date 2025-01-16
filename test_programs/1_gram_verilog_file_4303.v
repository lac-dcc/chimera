// Seed: 273644936
module module_0 (
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
    id_16
);
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_17(
      1'b0, id_10, id_4, 1'b0, 1'h0 != id_10, -1'b0, id_9, id_15, id_5
  );
  assign module_1.type_0 = 0;
  wire id_18;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4
);
  wire id_6, id_7;
  nor primCall (id_1, id_6, id_2, id_3, id_4, id_0);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
