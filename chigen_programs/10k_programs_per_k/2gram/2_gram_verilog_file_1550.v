// Seed: 717460202
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  assign module_1.id_8 = 0;
  output tri1 id_1;
  assign id_1 = -1'b0;
endmodule
module module_1 #(
    parameter id_10 = 32'd24
) (
    output logic id_0,
    input  wire  id_1,
    input  uwire id_2
    , id_6,
    output tri1  id_3,
    output logic id_4
);
  wire id_7;
  assign id_4 = -1;
  bit id_8;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_6
  );
  initial begin : LABEL_0
    assign id_8 = 1;
  end
  logic id_9 = 1;
  parameter id_10 = 1;
  wire [id_10 : 1 'd0] id_11;
  always id_0 = id_7;
  assign id_9 = id_1;
  always @(posedge -1 or id_6#(-1)) begin : LABEL_1
    #1 id_4 <= 1;
    wait (-1);
    id_8 = id_11;
    disable id_12;
    $clog2(id_10);
    ;
  end
endmodule
