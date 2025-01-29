// Seed: 3315635009
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input  tri  id_0,
    output tri1 id_1,
    output wor  id_2,
    output wand id_3
);
  wire id_5;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6
  );
  wire id_7 = id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  function id_7(id_8, id_9);
    if ("") begin : LABEL_0
      id_7 = id_9;
      id_1 <= -1'b0;
    end else id_1 = id_2 && id_3 ? id_2 : -1;
  endfunction
  module_0 modCall_1 (
      id_4,
      id_9,
      id_8,
      id_9
  );
endmodule
