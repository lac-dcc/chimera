// Seed: 3256097899
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_7 :
  assert property (@(posedge ~id_7) 1)
  else $unsigned(69);
  ;
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output reg id_2;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_10,
      id_9,
      id_9,
      id_10
  );
  output wire id_1;
  always_ff @(negedge 1 or posedge id_7 !=? -1) begin : LABEL_0
    id_2 <= 1'b0 != -1'h0;
  end
  assign id_2 = id_8;
endmodule
