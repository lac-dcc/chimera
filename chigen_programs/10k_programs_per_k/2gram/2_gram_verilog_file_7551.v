// Seed: 2962191119
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  assign module_1.id_1 = 0;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_13 = id_7;
  logic id_14, id_15, id_16;
  logic id_17;
endmodule
module module_1 #(
    parameter id_3 = 32'd85
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_5,
      id_5,
      id_6,
      id_4,
      id_2,
      id_6,
      id_2
  );
  inout wire id_4;
  inout wire _id_3;
  inout wire id_2;
  inout tri id_1;
  assign id_1 = -1;
  assign id_7[id_3] = 1;
  wire id_8;
  ;
  final begin : LABEL_0
    @(posedge -1)
    @(1 && -id_4 && id_1) begin : LABEL_1
      $clog2(73);
      ;
    end
  end
endmodule
