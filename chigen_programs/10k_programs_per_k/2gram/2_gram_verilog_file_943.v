// Seed: 4067139321
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input uwire id_2
    , id_15,
    output supply0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    output tri id_9,
    input tri id_10,
    input wor id_11,
    input uwire id_12,
    output wor id_13
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri id_0,
    input logic id_1,
    input wor id_2,
    input uwire id_3,
    output uwire id_4,
    output wand id_5,
    input tri0 id_6
    , id_12,
    output logic id_7,
    output wor id_8,
    input supply0 id_9,
    output tri id_10
);
  function void id_13(input id_14);
    id_7 <= id_1;
    id_7 = 1;
    id_4 = 1;
    if (1) begin : LABEL_0
      `define pp_15 0
    end
  endfunction
  buf primCall (id_7, id_2);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_4,
      id_5,
      id_9,
      id_4,
      id_9,
      id_9,
      id_10,
      id_6,
      id_3,
      id_9,
      id_4
  );
  wire id_16;
endmodule
