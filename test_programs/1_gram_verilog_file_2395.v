// Seed: 1562522437
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_4 = id_4;
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
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
endmodule
module module_2 (
    input wire id_0,
    input tri0 id_1,
    input uwire id_2,
    output wire id_3,
    output tri id_4,
    input wand id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    output wire id_9,
    output uwire id_10,
    input tri1 id_11,
    input wand id_12,
    input supply0 id_13,
    input tri1 id_14,
    output tri1 id_15,
    output tri1 id_16,
    input wor id_17,
    output uwire id_18
);
  initial id_16 = -1;
  wand id_20;
  supply1 id_21;
  id_22(
      .id_0("" * id_14)
  );
  reg id_23;
  assign id_21 = 1;
  wire id_24;
  always @(posedge -1)
    if (-1)
      if (id_11) #1 id_4 = id_12;
      else id_23 <= 1'h0;
  bit id_25 = id_23;
  assign id_20 = id_17;
  wire id_26, id_27, id_28, id_29;
  uwire id_30 = id_30 ? id_5 : -1;
  module_0 modCall_1 (
      id_28,
      id_28,
      id_27
  );
  xor primCall (
      id_3,
      id_27,
      id_29,
      id_0,
      id_7,
      id_13,
      id_25,
      id_26,
      id_28,
      id_30,
      id_21,
      id_22,
      id_2,
      id_5,
      id_6,
      id_12,
      id_24,
      id_8,
      id_17,
      id_14,
      id_1,
      id_11
  );
endmodule
