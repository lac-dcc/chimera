// Seed: 3093013423
module module_0 (
    output tri id_0,
    input supply0 id_1
    , id_11,
    input tri0 id_2,
    output uwire id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    output supply1 id_7,
    input tri id_8,
    input wire id_9
);
  parameter id_12 = 1;
  parameter id_13 = id_12;
endmodule
module module_1 #(
    parameter id_0 = 32'd96,
    parameter id_1 = 32'd33
) (
    output uwire _id_0,
    output tri0  _id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  wand  id_4,
    output tri1  id_5,
    output tri1  id_6,
    output logic id_7,
    input  tri   id_8 [-1 : id_1  -  -1 'b0],
    output wand  id_9
);
  initial id_7 <= -1'b0;
  union packed {
    logic id_11;
    logic id_12;
    logic id_13;
  } id_14;
  struct packed {
    enum logic {
      id_15 = 1,
      id_16[- 1  : - 1] = -1,
      id_17[1] = id_14,
      id_18 = id_14.id_11
    } id_19;
  } id_20;
  ;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_2,
      id_9,
      id_8,
      id_3,
      id_4,
      id_5,
      id_3,
      id_2
  );
  wire id_21 = id_14;
  wire id_22;
  ;
  logic id_23;
  assign id_5 = id_14.id_13;
  wire id_24;
  logic [id_0 : 1] id_25;
endmodule
