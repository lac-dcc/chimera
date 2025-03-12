// Seed: 3851384968
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input wand id_2,
    input wire id_3,
    input tri1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input supply1 id_9,
    output supply1 id_10
);
  wire id_12;
  integer id_13;
  assign module_1.id_2 = 0;
  assign id_5 = id_9;
  wire id_14;
  wire id_15, id_16, id_17, id_18;
  logic id_19;
  logic id_20;
endmodule
module module_1 #(
    parameter id_1 = 32'd17,
    parameter id_3 = 32'd23,
    parameter id_4 = 32'd61
) (
    output uwire id_0,
    input  wor   _id_1,
    input  wor   id_2,
    input  tri1  _id_3[-1 : id_3],
    input  tri1  _id_4
);
  tri1 id_6;
  xor primCall (id_0, id_2, id_6, id_11, id_8, id_9, id_10, id_7);
  logic [7:0][id_4 : id_4] id_7;
  assign id_6 = 1;
  genvar id_8;
  logic id_9 = {id_7[1]};
  logic id_10;
  parameter id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0
  );
  bit id_12[id_1 : 1] = id_1, id_13, id_14;
  if (id_11[-1] ? -1'b0 : id_11) wire id_15;
  else begin : LABEL_0
    final id_13 = new;
  end
  assign id_14 = id_11;
  localparam id_16 = id_11;
endmodule
