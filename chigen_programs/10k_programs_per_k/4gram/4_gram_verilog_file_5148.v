// Seed: 1236387315
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_3
  );
endmodule
module module_0 (
    input tri id_0,
    output tri id_1,
    output uwire id_2,
    output uwire id_3,
    output supply0 id_4,
    output tri0 id_5,
    output tri0 id_6,
    input wire id_7,
    input uwire id_8,
    input supply1 id_9,
    input wire id_10,
    output wand id_11,
    input tri id_12,
    output supply1 id_13,
    input wire id_14,
    input tri0 module_2,
    output supply1 id_16
    , id_25,
    input wor id_17,
    input tri0 id_18,
    input supply1 id_19,
    input wire id_20,
    input uwire id_21
    , id_26,
    input tri1 id_22,
    output supply1 id_23
);
  wire id_27;
  supply0 id_28 = id_17 - id_26;
  assign module_3.type_1 = 0;
endmodule
module module_3 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wor  id_3,
    input wand id_4
);
  tri0 id_6;
  always @(posedge "") begin : LABEL_0
    id_6 = id_4;
    id_6 = id_3;
  end
  module_2 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_4,
      id_2,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_4,
      id_6,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_6
  );
  wire id_7;
  wand id_8 = 1;
endmodule
