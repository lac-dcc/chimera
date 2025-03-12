// Seed: 1608127316
module module_0 #(
    parameter id_2 = 32'd87
);
  parameter id_1 = 1;
  parameter id_2 = (id_1[id_2] ? id_1 : -1);
  assign module_1.id_0 = 0;
  wire module_0;
  reg  id_3;
  always @(posedge id_3) begin : LABEL_0
    if (id_2) begin : LABEL_1
      disable id_4;
    end
  end
  initial begin : LABEL_2
    id_3 <= id_1 < id_1[-1];
  end
  wire id_5;
  wand id_6;
  assign id_6 = -1;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    output wand id_3,
    input supply1 id_4
);
  wire ["" : 1] id_6;
  module_0 modCall_1 ();
endmodule
