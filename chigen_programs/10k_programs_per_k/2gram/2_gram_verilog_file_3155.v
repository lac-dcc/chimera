// Seed: 43554053
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output wand id_2,
    output tri id_3,
    input wire id_4,
    input supply1 id_5
);
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply1 id_0
    , id_5,
    input tri id_1,
    output wire id_2,
    output uwire id_3
);
  supply0 id_6 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_3,
      id_0,
      id_1
  );
endmodule
module module_2 (
    input tri id_0,
    input uwire id_1,
    input logic id_2,
    output wand id_3,
    output wor id_4,
    input supply0 id_5,
    input wor id_6
);
  function id_8;
    output id_9;
    @(negedge ~1 or id_8 + (1 ^ id_8)) begin : LABEL_0
      id_8 = #1 id_2;
    end
  endfunction
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_4,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.type_7 = 0;
  assign id_9 = 1;
  always $display(1, id_8);
endmodule
