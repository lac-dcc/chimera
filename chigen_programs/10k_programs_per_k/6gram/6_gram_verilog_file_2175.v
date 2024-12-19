// Seed: 1215721814
module module_0;
  assign id_1 = 1 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always @(id_7) begin : LABEL_0
    id_7 = #id_8 id_3 && 1 === id_7 && 1;
    disable id_9;
    wait (1);
  end
  module_0 modCall_1 ();
  always @(posedge id_7) begin : LABEL_0
    id_7 <= 1;
  end
endmodule
