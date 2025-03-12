// Seed: 1098831126
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
    id_16,
    id_17
);
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout supply0 id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout supply1 id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_14 = (~id_17) - 1'b0;
  assign id_15 = id_6;
  assign id_7  = {-1'h0{id_6}};
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output tri0 id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  and primCall (id_4, id_1, id_11, id_2, id_12, id_7, id_15);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_4,
      id_2,
      id_2,
      id_2,
      id_15,
      id_12,
      id_11,
      id_9,
      id_11,
      id_11,
      id_15,
      id_2,
      id_10,
      id_1
  );
  input wire id_1;
  assign id_10 = 1'd0;
endmodule
