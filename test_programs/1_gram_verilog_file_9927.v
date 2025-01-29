// Seed: 3294684884
module module_0 ();
  assign id_1 = -1'b0;
  wire id_2;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  tri1  id_0,
    output uwire id_1,
    output logic id_2,
    output uwire id_3
);
  always begin : LABEL_0
    id_2 <= 1;
  end
  buf primCall (id_1, id_5);
  parameter id_5 = -1'b0;
  module_0 modCall_1 ();
endmodule
module module_3;
  wire id_1;
  id_3(
      id_2, id_1
  );
  wire id_4, id_5, id_6;
  module_0 modCall_1 ();
  id_7(
      id_1
  );
  wire id_8, id_9;
  initial $display(id_9);
  timeunit 1ps;
endmodule
