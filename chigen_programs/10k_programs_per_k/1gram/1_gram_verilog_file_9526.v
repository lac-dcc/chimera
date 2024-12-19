// Seed: 1959203727
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
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign module_1.id_1 = 0;
  id_11 :
  assert property (@(posedge 1 | id_6) id_5) $display;
endmodule
module module_1 ();
  always begin : LABEL_0
    id_1 = 1'd0;
    id_1 <= id_1;
  end
  assign id_2 = id_2;
  wire id_3;
  assign id_2 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
