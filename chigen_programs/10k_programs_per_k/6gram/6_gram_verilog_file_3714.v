// Seed: 3257740534
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  assign module_1.id_3 = 0;
  initial begin : LABEL_0
    id_7 = id_4;
    disable id_8;
  end
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    output wand  id_2,
    input  logic id_3
    , id_6, id_7,
    output wire  id_4
);
  wire id_8;
  logic id_9, id_10, id_11, id_12;
  wire id_13;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_13,
      id_8
  );
  always @(id_11, posedge 1, posedge id_3)
    if (id_7 || 1'b0) begin : LABEL_0
      id_0 <= 1'b0;
    end else id_10 <= 1;
  assign id_12 = 1;
  initial assume (1'b0);
endmodule
