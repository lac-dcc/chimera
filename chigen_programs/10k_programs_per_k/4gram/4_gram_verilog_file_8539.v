// Seed: 3732316501
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always @(negedge 1) begin : LABEL_0
    id_3 = id_1;
  end
  wire id_4;
  assign module_2.type_13 = 0;
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
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6
  );
endmodule
module module_2 (
    input uwire id_0,
    input uwire id_1,
    input tri   id_2
);
  wire id_4;
  wire id_5;
  wor  id_6;
  wor  id_7;
  module_0 modCall_1 (
      id_4,
      id_6
  );
  always @(negedge id_7) id_7 = id_6;
  wire id_8;
  initial begin : LABEL_0
    id_6 = 1'b0;
  end
endmodule
