// Seed: 1522243259
module module_0;
  wire id_1;
  module_2 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  nor primCall (id_1, id_3, id_4);
  always_ff begin : LABEL_0
    id_1 = id_2;
  end
  function id_3;
    input id_4;
    begin : LABEL_0
      assume (1);
    end
  endfunction
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign id_1 = 1;
  assign id_3 = id_3;
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
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
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = id_1;
  module_2 modCall_1 (
      id_3,
      id_1
  );
  wire id_9;
endmodule
