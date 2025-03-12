// Seed: 3774287675
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri id_5,
    output wor id_6,
    input tri1 id_7,
    input supply1 id_8
);
  assign id_6 = id_8;
  wire [-1  -  -1 : -1 'b0] id_10, id_11, id_12;
  wire id_13;
  assign id_6 = id_11;
  struct packed {id_14 id_15;} id_16;
  ;
  assign id_16.id_14 = 1'b0;
  wire [1 : 1] id_17, id_18, id_19, id_20;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd69
) (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output wor void id_4,
    output wor id_5,
    input wire id_6,
    input tri1 id_7
    , _id_12,
    input uwire id_8,
    output supply1 id_9,
    output supply0 id_10
);
  logic [7:0] id_13;
  assign id_13[id_12] = id_7;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_0,
      id_5,
      id_5,
      id_7,
      id_1
  );
endmodule
