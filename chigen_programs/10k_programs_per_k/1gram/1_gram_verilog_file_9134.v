// Seed: 1922498847
module module_0 (
    input supply1 id_0
    , id_9,
    input tri0 id_1,
    input tri0 id_2,
    input wor id_3,
    input wand id_4,
    output tri0 id_5,
    input wand id_6,
    output supply1 id_7
);
endmodule
module module_1 #(
    parameter id_10 = 32'd26,
    parameter id_4  = 32'd14
) (
    input supply0 id_0,
    output supply1 id_1,
    output tri1 id_2,
    input wand id_3,
    input tri _id_4,
    output uwire id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8
);
  wire [-1 'b0 : id_4] _id_10, id_11, id_12, id_13;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_8,
      id_6,
      id_1,
      id_7,
      id_5
  );
  assign modCall_1.id_5 = 0;
  function void id_14;
    output [1 : id_10] id_15 = 1;
    input logic id_16;
    id_16 <= id_6;
  endfunction
endmodule
