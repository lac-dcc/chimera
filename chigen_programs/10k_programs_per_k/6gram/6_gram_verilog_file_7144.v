// Seed: 1512742850
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1[1] = id_2;
  assign module_2.id_3 = 0;
endmodule
module module_1;
  assign id_1[1'b0] = (1);
  wire id_2;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  always @(negedge 1) begin : LABEL_0
    disable id_3;
  end
  wire id_4;
  wire id_5;
  logic [7:0] id_6 = id_1;
endmodule
module module_2 (
    input  logic id_0,
    output logic id_1,
    output wire  id_2,
    input  uwire id_3
    , id_6,
    output wire  id_4
);
  integer id_7, id_8;
  module_0 modCall_1 (
      id_8,
      id_6
  );
  always id_1 <= #1 id_0;
  assign id_7[1] = id_8;
endmodule
