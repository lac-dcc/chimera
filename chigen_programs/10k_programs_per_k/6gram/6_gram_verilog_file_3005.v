// Seed: 2612903349
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input tri id_2
);
  id_4(
      .id_0(1)
  );
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output supply0 id_3,
    output tri0 id_4,
    output uwire id_5
);
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1
  );
  supply0 id_11;
  wire id_12;
  wand id_13 = {id_13, 1'b0} - id_11;
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
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32
);
  inout wire id_32;
  input wire id_31;
  inout wire id_30;
  output wire id_29;
  output wire id_28;
  input wire id_27;
  input wire id_26;
  output wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_33;
  tri1 id_34 = 1;
  wire id_35;
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  module_2 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_14,
      id_4,
      id_6,
      id_11,
      id_9,
      id_4,
      id_14,
      id_13,
      id_4,
      id_6,
      id_3,
      id_14,
      id_3,
      id_1,
      id_13,
      id_11,
      id_8,
      id_4,
      id_4,
      id_6,
      id_14,
      id_13,
      id_5,
      id_4,
      id_9
  );
  wire id_15 = id_14;
  and primCall (id_9, id_13, id_4, id_2, id_5, id_3, id_7, id_8, id_6, id_14);
  always @(1 or 1'b0) begin : LABEL_0
    wait (1);
  end
endmodule
