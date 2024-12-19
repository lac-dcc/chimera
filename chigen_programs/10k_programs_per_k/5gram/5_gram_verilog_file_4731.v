// Seed: 1722258325
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = 1 == id_3;
  assign module_3.id_2 = 0;
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1
);
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3
  );
endmodule
module module_2 (
    input  uwire id_0
    , id_4,
    output wand  id_1,
    output tri1  id_2
);
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  uwire id_9 = id_5;
  assign id_1 = id_5;
  id_10 :
  assert property (@(posedge id_10) id_8)
  else $display(id_9);
  assign id_1 = id_10;
  wire id_11;
  wire id_12;
  assign id_7  = ~id_10;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_11,
      id_4
  );
  function id_13;
    input id_14;
    begin : LABEL_0
      id_10 = 1;
    end
  endfunction
  wire id_15;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      #1;
    end
    cover (id_1);
    wait (id_4);
  end
  wire id_16;
endmodule
