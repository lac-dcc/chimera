// Seed: 2484321264
module module_0 #(
    parameter id_1 = 32'd83,
    parameter id_2 = 32'd79
);
  defparam id_1.id_2 = 1;
  assign module_2.type_7 = 0;
  assign module_1.id_3   = 0;
  timeunit 1ps / 1ps;
  wire id_3;
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    input  wor   id_2,
    input  tri1  id_3
);
  assign id_1 = 1'b0;
  assign id_1 = id_0;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output logic id_0,
    output logic id_1
);
  always @(posedge id_3) begin : LABEL_0
    id_0 = 1;
    if (1'b0) id_0 <= id_3;
    else begin : LABEL_0
      id_0 <= 1;
    end
    begin : LABEL_0
      id_1 = #id_4 1 == id_3;
    end
  end
  module_0 modCall_1 ();
  wire id_5;
  wire id_6;
endmodule
