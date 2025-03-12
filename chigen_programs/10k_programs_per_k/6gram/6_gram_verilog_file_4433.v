// Seed: 3407191964
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout supply0 id_3;
  inout wire id_2;
  inout uwire id_1;
  assign id_1 = 1;
  assign id_3 = (1);
  logic id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output reg id_4;
  input wire id_3;
  inout wand id_2;
  inout wire id_1;
  localparam id_5 = 1;
  wire id_6;
  wire id_7;
  ;
  nor primCall (id_1, id_2, id_3);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7
  );
  wire id_8;
  assign id_2 = 1;
  wire id_9;
  always @* begin : LABEL_0
    fork
      id_10;
    join_any
    id_4 = id_8;
  end
endmodule
