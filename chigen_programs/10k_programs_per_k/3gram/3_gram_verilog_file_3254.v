// Seed: 2707749921
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
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always release id_4;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1,
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_6,
      id_6,
      id_6,
      id_4
  );
  generate
    assign id_6 = id_1;
    always @(1) begin : LABEL_0
      id_3 <= 1;
      id_2 <= 1;
    end
    initial begin : LABEL_0
      id_4 = 1;
    end
  endgenerate
  id_7 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    id_3 <= 1;
  end
  assign id_7 = id_1;
  reg id_8 = (id_3);
endmodule
