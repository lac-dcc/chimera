// Seed: 172284026
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_4;
  wire  id_5;
  logic id_6 = id_4;
  assign id_6 = id_3;
  always id_6 <= {id_5{-1}};
  wire id_7;
  ;
  wire  id_8;
  uwire id_9 = -1;
  wire id_10, id_11, id_12;
endmodule
module module_1 #(
    parameter id_10 = 32'd75,
    parameter id_6  = 32'd23
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_12,
      id_1,
      id_9
  );
  inout wire _id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire _id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  task id_15;
    output [$realtime ^  1 'd0 : -1] id_16;
    output [-1 'd0 : id_10] id_17;
    logic [1 : id_6] id_18;
    begin : LABEL_0
      release id_11;
      id_15 <= -1;
    end
  endtask
  wire id_19;
  assign id_1 = (id_15);
endmodule
