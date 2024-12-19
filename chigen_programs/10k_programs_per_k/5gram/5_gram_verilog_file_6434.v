// Seed: 603324604
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_1 or id_2) begin : LABEL_0
    wait (id_1);
  end
  nor primCall (id_4, id_7, id_3, id_2, id_5, id_1);
  initial begin : LABEL_0
    id_4 <= 1;
  end
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_6
  );
  wire id_8;
endmodule
