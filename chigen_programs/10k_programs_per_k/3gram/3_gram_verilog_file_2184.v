// Seed: 713011334
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_5;
  wire id_6;
  assign id_2 = ~id_4;
  id_7 :
  assert property (@(posedge id_5) id_4)
  else begin : LABEL_0
    #1;
    $display;
  end
  logic [7:0] id_8;
  assign id_8[1 : 1] = id_7;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1
);
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_6
  );
endmodule
