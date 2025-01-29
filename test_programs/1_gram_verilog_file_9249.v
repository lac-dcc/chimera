// Seed: 105342898
module module_0 ();
  always id_1 <= 1;
  assign module_2.type_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3[-1 : 1'b0] = id_5;
  wire id_7;
  module_0 modCall_1 ();
  parameter id_8 = id_4.id_5;
  nor primCall (id_1, id_2, id_3, id_4, id_5, id_6, id_7);
endmodule
module module_2 (
    output uwire id_0,
    inout wand id_1,
    output supply1 id_2,
    input logic id_3,
    output wand id_4,
    output wor id_5
);
  initial begin : LABEL_0
    begin : LABEL_0
      if (id_3)
        if (1'd0) force id_4#(-id_3[1 :-1], id_1) = id_3;
        else disable id_7;
    end
    id_0 = id_1;
  end
  initial $display(-1);
  nor primCall (id_0, id_1, id_10, id_11, id_12, id_13, id_3, id_7, id_8, id_9);
  wire id_8, id_9;
  wire id_10, id_11, id_12, id_13;
  module_0 modCall_1 ();
endmodule
