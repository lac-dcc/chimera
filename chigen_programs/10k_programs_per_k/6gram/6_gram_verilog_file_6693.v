// Seed: 2447478866
module module_0 (
    output wor id_0,
    output wor id_1,
    input uwire id_2,
    input uwire id_3,
    output uwire id_4
    , id_14, id_15,
    output supply0 id_5,
    input uwire id_6
    , id_16,
    output uwire id_7,
    output tri id_8,
    input wand id_9,
    input wire id_10,
    output wor id_11,
    input supply0 id_12
);
  supply1 id_17;
  function automatic id_18;
    input integer id_19;
    id_17 = id_3;
  endfunction
  wire id_20;
  assign id_14[1'b0] = id_16;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri   id_1,
    output logic id_2,
    output tri0  id_3
);
  initial begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
