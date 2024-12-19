// Seed: 3354817055
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    input wand id_0
);
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  specify
    (id_3 => id_4) = (id_4, 1, ~id_4);
  endspecify
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  function id_9;
    input id_10;
    #id_11 do id_4 <= 1; while (1'b0);
  endfunction
  uwire id_12, id_13;
  tri  id_14 = (1'd0), id_15 = 1'b0;
  wire id_16;
  always #1
    @(id_12) begin : LABEL_0
      if (1) $display;
    end
  module_0 modCall_1 (
      id_16,
      id_11,
      id_15
  );
endmodule
