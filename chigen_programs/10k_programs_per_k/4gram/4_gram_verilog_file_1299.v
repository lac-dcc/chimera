// Seed: 3431294590
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_5 - id_6;
endmodule
module module_1 (
    input  tri   id_0,
    input  tri   id_1,
    input  logic id_2,
    input  wand  id_3,
    output logic id_4
);
  initial begin : LABEL_0
    #1;
    id_4 <= 1'b0;
    #1
    @(negedge 1) begin : LABEL_0
      fork
        `define pp_6 0
        `pp_6 <= id_2;
        id_7(~1);
      join
    end
    id_4 <= 1;
    id_4 -= id_3;
  end
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
  wire id_9;
  wire id_10;
  always disable id_11;
endmodule
