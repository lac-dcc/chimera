// Seed: 1626638942
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  module_0(
      id_4, id_6, id_3, id_2
  );
endmodule
module module_2 (
    input  tri1  id_0,
    output logic id_1,
    output tri   id_2
);
  always @(posedge id_0) begin
    id_1 <= 1;
  end
endmodule
module module_3 (
    input  uwire id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  logic id_3,
    input  wor   id_4
);
  logic id_6;
  module_2(
      id_2, id_6, id_1
  );
  initial begin
    id_6 <= (1'h0);
  end
  assign id_6 = id_3;
  assign id_6 = 1;
endmodule
