// Seed: 959132373
module module_0 ();
  parameter id_1 = 1;
endmodule
module module_1;
  always begin : LABEL_0
    id_1 = id_1;
    id_2 <= -1;
  end
  always_latch
    if (1'b0) wait (1) id_3 <= id_3;
    else id_4 <= #1 id_3;
  module_0 modCall_1 ();
  always begin : LABEL_0
    id_3 <= -1;
    $display(-1, 1);
    @(-1'b0 or posedge "")
    #1 begin : LABEL_0
      id_3 = -1;
    end
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_7 = 1 - -1;
  module_0 modCall_1 ();
endmodule
