// Seed: 4057284167
module module_0;
  wire id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3[1] = id_1;
  assign id_2 = id_1 !=? 1'b0;
  always #1 begin : LABEL_0
    id_2 <= id_1;
  end
  or primCall (id_2, id_4, id_5, id_6, id_7, id_8);
  always_latch #(id_1 - id_1);
  wire id_4 = 1, id_5;
  logic [7:0] id_6;
  wire id_7;
  assign id_6[1] = 1;
  wire id_8 = id_8;
  module_0 modCall_1 ();
endmodule
