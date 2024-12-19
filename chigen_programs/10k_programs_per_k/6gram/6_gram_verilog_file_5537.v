// Seed: 68922486
module module_0;
  initial begin : LABEL_0
    fork
      $display;
    join
  end
  assign module_2.type_4 = 0;
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
  input wire id_2;
  inout wire id_1;
  always @(posedge ({1, id_3} || 1)) id_1 = id_3;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply1 id_0,
    input logic id_1,
    input wor id_2,
    input tri id_3,
    output logic id_4,
    output wor id_5,
    output logic id_6,
    input tri id_7,
    output uwire id_8
    , id_10
);
  initial begin : LABEL_0
    id_6  <= 1'd0;
    id_4  <= 1;
    id_10 <= id_1;
  end
  module_0 modCall_1 ();
endmodule
