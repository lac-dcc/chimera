// Seed: 1215334974
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
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
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_9 :
  assert property (@(posedge id_1) 1)
  else $display(1);
  id_10(
      .id_0(id_9), .id_1(1)
  );
  module_0 modCall_1 (
      id_7,
      id_1,
      id_5
  );
  wire id_11;
  wire id_12, id_13;
  wire id_14 = id_11;
  always @(posedge 1) begin : LABEL_0
    id_4 <= #1 1'd0;
  end
  wire id_15;
endmodule
