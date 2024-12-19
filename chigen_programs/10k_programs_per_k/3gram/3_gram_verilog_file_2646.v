// Seed: 3888093539
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1;
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
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_11 :
  assert property (@(posedge id_11) id_11)
  else if (id_4 > 1'b0) begin : LABEL_0
    #1 begin : LABEL_0
      if (1'h0) id_3 = id_5 ^ id_3;
      else id_11 <= 1;
    end
    id_11 = 1;
  end else id_9 <= 1;
  initial begin : LABEL_0
    id_3 <= 1;
  end
  initial begin : LABEL_0
    id_6 <= 1;
  end
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_10
  );
  assign modCall_1.id_4 = 0;
  wire id_13;
  assign id_6 = id_2;
endmodule
