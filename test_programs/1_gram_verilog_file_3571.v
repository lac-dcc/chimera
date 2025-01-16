// Seed: 1871137455
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always begin : LABEL_0
    #1 if (id_3) id_2 = -1'd0 ? id_6 : id_3;
  end
  assign id_3 = 1'b0;
  tri1 id_9;
  localparam id_10 = -1;
  assign id_9 = id_6;
  tri1 id_11;
  assign id_7 = id_6;
  assign id_2 = {id_11, 1'b0};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
  final id_7 <= id_3;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_4,
      id_4,
      id_4,
      id_4,
      id_8,
      id_4
  );
  assign modCall_1.id_9 = 0;
  generate
    begin : LABEL_0
      assign id_4 = id_4;
      assign id_6 = 1 - id_4;
    end
    always id_6 <= 1;
  endgenerate
  initial id_1 <= 1'b0;
  assign id_7 = -1;
  wire id_9;
  bit id_10, id_11, id_12;
  always id_10 <= id_11;
  id_13 :
  assert property (@(-1 - 1) 1'b0) id_8 = (1);
endmodule
