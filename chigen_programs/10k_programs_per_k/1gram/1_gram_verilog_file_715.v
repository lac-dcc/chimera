// Seed: 1717408005
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    output uwire id_2,
    output uwire id_3,
    output wor id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7,
    input tri id_8,
    output tri id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    input tri1 id_13,
    output supply1 id_14,
    output tri1 id_15,
    input tri id_16,
    input wand id_17,
    input tri id_18,
    output wand id_19,
    input wire id_20
    , id_25,
    input wor id_21,
    output supply0 id_22,
    input supply1 id_23
);
endmodule
module module_1 #(
    parameter id_8 = 32'd94
) (
    output wor   id_0,
    input  wire  id_1,
    output logic id_2
);
  logic id_4;
  supply0 id_5, id_6;
  logic id_7, _id_8;
  logic id_9;
  wire  id_10;
  logic id_11;
  ;
  wire id_12;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign id_6 = id_12 | -1 && id_9;
  always begin : LABEL_0
    begin : LABEL_1
      id_2 <= id_1;
    end
  end
  struct packed {
    logic [~  id_8 : 1] id_13;
    logic id_14;
  } [-1 : 1  &&  -1] id_15;
  ;
  wire [1 : 1] id_16, id_17, id_18, id_19, id_20;
  nand primCall (id_2, id_6, id_9, id_11, id_10, id_1, id_5, id_4);
endmodule
