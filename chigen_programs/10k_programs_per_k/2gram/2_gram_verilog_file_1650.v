// Seed: 4104464483
module module_0;
  always begin : LABEL_0
    id_1 = id_1 - 1;
    id_1 <= 1;
    id_1 <= #1 id_1;
    if ((id_1)) begin : LABEL_0
      if (1) id_1 <= id_1;
    end
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    output wand id_2,
    input logic id_3,
    input wand id_4,
    input wor id_5
    , id_17,
    output logic id_6,
    output supply0 id_7,
    input supply1 id_8,
    input wire id_9,
    input supply1 id_10,
    input supply0 id_11
    , id_18,
    input tri1 id_12,
    input uwire id_13,
    output tri1 id_14,
    output logic id_15
);
  function id_19;
    input id_20;
    input id_21;
    cover (1'h0);
  endfunction
  assign id_21 = 1;
  always begin : LABEL_0
    id_6 <= 1'b0;
    id_15 = 1;
    #1 begin : LABEL_0
      id_21 <= 1;
    end
    id_15 <= id_3;
    id_15 = id_17;
  end
  module_0 modCall_1 ();
endmodule
