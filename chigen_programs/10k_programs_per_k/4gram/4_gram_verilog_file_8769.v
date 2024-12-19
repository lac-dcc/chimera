// Seed: 1141686745
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
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  for (id_13 = id_5; 1'd0; id_7 = id_13) begin : LABEL_0
    initial begin : LABEL_0
      id_1 = 1;
      #1;
      $display(id_6);
    end
    assign id_2[1] = {id_4{id_4}};
  end
  wire  id_14 = (id_4);
  uwire id_15 = 1;
endmodule
module module_1 (
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
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    id_8[1 : 1] = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_8,
      id_6,
      id_13,
      id_12,
      id_12,
      id_12,
      id_13,
      id_4,
      id_3,
      id_11,
      id_12
  );
  assign modCall_1.id_7 = 0;
endmodule
