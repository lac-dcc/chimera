// Seed: 1369980235
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_4;
  wor  id_5;
  genvar id_6;
  id_7 :
  assert property (@(posedge id_4 * id_5 - 1) 1'd0)
  else begin : LABEL_0
    id_6 <= {1 !=? ("")};
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_4
  );
  uwire id_8 = id_5;
  reg   id_9;
  wire  id_10;
  wire  id_11;
  initial begin : LABEL_0
    if (1) id_7 <= 1;
    else begin : LABEL_0
      id_9 <= id_3;
    end
  end
endmodule
