// Seed: 4144853493
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
    id_14
);
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_15 = 1;
  assign module_1.id_7 = 0;
  wire id_16;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input wire id_8,
    input supply1 id_9
    , id_11
);
  assign id_7 = -1'b0 ? id_1 : id_9;
  nor primCall (id_3, id_4, id_2, id_9, id_8, id_6, id_11, id_1);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
  generate
    assign id_0 = id_1;
    assign id_0 = 1;
  endgenerate
endmodule
