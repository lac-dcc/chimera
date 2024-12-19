// Seed: 1862538116
module module_0;
  always begin : LABEL_0
    if (id_1 > 1) begin : LABEL_0
      fork
        id_1 = #1  (id_1);
        id_1 <= id_1;
      join_any
    end
  end
  assign id_2[1] = 1;
  logic [7:0] id_3;
  wire id_4;
  assign id_2[1] = id_2;
  assign id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    module_1,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  xor primCall (id_2, id_4, id_5, id_8);
  module_0 modCall_1 ();
endmodule
