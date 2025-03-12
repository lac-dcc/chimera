// Seed: 192461465
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output reg id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output reg id_2;
  input wire id_1;
  logic id_7;
  always #1 begin : LABEL_0
    id_2 <= -1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_7,
      id_4,
      id_4
  );
  always id_6 <= #1 id_7;
endmodule
