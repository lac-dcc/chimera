// Seed: 4045593681
module module_0 ();
  uwire id_2;
  wor id_3;
  logic [7:0] id_4;
  reg id_5;
  wor id_6;
  id_7 :
  assert property (@(posedge id_3) 1 ? 1 * id_5 : id_2)
  else begin : LABEL_0
    id_4[1'h0] <= 1;
  end
  wire id_8;
  assign id_1 = id_6;
  id_9 :
  assert property (@(posedge id_1) 1'h0)
  else id_9 = 1;
  id_10 :
  assert property (@(posedge id_6) (id_9++))
  else begin : LABEL_0
    id_9 = 1 + id_7;
    id_5 <= id_1 + id_7;
  end
  wire id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 ();
  assign id_4 = 1 && 1;
endmodule
