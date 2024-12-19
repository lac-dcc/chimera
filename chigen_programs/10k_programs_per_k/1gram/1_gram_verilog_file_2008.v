// Seed: 2907980073
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  initial $display(1);
  always_ff #1 id_2 = 1;
  assign id_2 = 1 - 1'b0;
  always begin : LABEL_0
    id_2 = id_1;
    id_2 <= #1 id_1;
  end
  assign id_2 = id_3 && ~id_1 - ~id_3;
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_7 = id_4;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  reg id_5, id_6;
  reg id_7 = 1'd0;
  id_8 :
  assert property (@(posedge id_7) 1) id_6 <= id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4
  );
  always id_7 = 1;
  supply0 id_9 = 1;
  assign id_7 = 1;
endmodule
