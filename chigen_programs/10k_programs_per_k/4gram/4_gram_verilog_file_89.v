// Seed: 4133754880
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1
);
  assign id_3 = (id_1);
  wor id_4 = (id_1) - 1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4
  );
  wire id_7;
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
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge id_4 or negedge id_2) begin : LABEL_0
    id_4 = id_2;
    if (1) id_4 <= id_4;
  end
  wire id_7;
  wire id_8;
  nand primCall (id_6, id_7, id_4, id_2, id_3, id_8);
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6
  );
endmodule
