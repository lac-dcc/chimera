// Seed: 3316429405
module module_0 (
    output wor   id_0,
    output wor   id_1,
    output tri   id_2,
    input  wire  id_3,
    input  tri   id_4,
    output tri   id_5,
    input  wand  id_6,
    output wire  id_7,
    input  uwire id_8
);
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    input wand id_4,
    output tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    input supply0 id_9,
    output logic id_10,
    input wor id_11,
    output wor id_12,
    input wire id_13,
    input supply0 id_14
);
  localparam id_16 = -1'b0;
  initial @((id_9)) id_10 <= 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_0,
      id_3,
      id_1,
      id_0,
      id_11,
      id_12,
      id_14
  );
  assign modCall_1.id_5 = 0;
  specify
    if (id_11) (id_17 => id_18) = (id_11,
                                   1  : {id_4, 1'b0, -1'b0, id_9, id_13, id_4, -1'h0} : id_1);
  endspecify
  wire id_19 = id_13;
  wire id_20;
  assign id_17 = 1'b0;
  logic id_21;
  ;
endmodule
