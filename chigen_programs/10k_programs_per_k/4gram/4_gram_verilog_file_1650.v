// Seed: 1573114372
module module_0;
  function id_2;
    input id_3;
    input id_4;
    input id_5;
    begin : LABEL_0
      #1;
      id_1 <= id_4;
    end
  endfunction
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  id_7(
      1'd0, id_2[1'h0]
  );
  wire id_8;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  wire id_9;
endmodule
