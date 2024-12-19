// Seed: 3579690228
module module_0 (
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
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
  id_5 :
  assert property (@(posedge id_2) 1)
  else begin : LABEL_0
    id_3 = id_2;
  end
  wire id_6;
  assign id_4[1'b0] = id_5;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_1,
      id_2,
      id_3,
      id_3,
      id_5,
      id_5
  );
  assign id_5 = id_5 & id_5;
endmodule
