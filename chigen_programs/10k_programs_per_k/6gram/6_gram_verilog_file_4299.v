// Seed: 4195652740
module module_0;
  parameter id_1 = 1;
  localparam id_2 = id_1;
  wire [-1 'h0 : -1] id_3;
  assign module_1.id_3 = 0;
  wire id_4;
  ;
endmodule
module module_1 (
    input  wire  id_0,
    input  wand  id_1,
    output logic id_2,
    input  wor   id_3
);
  initial begin : LABEL_0
    cover (id_0);
    id_2 <= -id_3;
  end
  module_0 modCall_1 ();
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout reg id_2;
  input wire id_1;
  assign id_5 = id_2;
  `define pp_8 0
  module_0 modCall_1 ();
  wor  module_2 = -1;
  wire id_9;
  ;
  wor id_10 = id_4((1)) == id_6;
  always repeat (1) for (id_10 = !id_4; id_5; id_2 = -1) $signed(52);
  ;
endmodule
