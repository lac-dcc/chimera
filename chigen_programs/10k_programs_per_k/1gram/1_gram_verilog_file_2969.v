// Seed: 1679363082
module module_0 (
    output logic id_0,
    input  wand  id_1,
    output wire  id_2,
    output wire  id_3
);
  reg id_5;
  always id_2 = 1;
  assign module_1.id_13 = 0;
  id_6 :
  assert property (@(id_1) 1) id_0 <= id_5;
endmodule
module module_1 (
    output wire id_0,
    input tri id_1,
    input supply1 id_2,
    input wand id_3,
    output logic id_4,
    output tri0 id_5
);
  assign id_5 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_5
  );
  wire id_7;
  wor id_8, id_9, id_10, id_11;
  assign id_10 = (1);
  initial begin : LABEL_0
    if (id_1) $display;
    else @(1'b0 < id_10 - 1'h0) id_8 = id_3;
    id_4 <= 1;
  end
  wire id_12 = id_9 ? 1 : 1, id_13;
  always_ff id_9 = 1;
endmodule
