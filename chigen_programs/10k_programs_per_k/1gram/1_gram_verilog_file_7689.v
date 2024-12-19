// Seed: 3293531602
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5, id_6;
  wire id_7 = id_7;
  assign id_1 = id_7;
  assign id_1 = id_5;
  assign id_1 = (id_6);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4
  );
  id_5 :
  assert property (@(posedge id_1) 1) begin : LABEL_0
    id_2 = id_4;
    id_5 = id_1;
    if (1) id_1 <= 1;
  end
  id_6(
      id_3 - 1, id_5
  );
  wire id_7;
  assign id_5 = id_5;
  wire id_8;
endmodule
