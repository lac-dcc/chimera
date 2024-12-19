// Seed: 1034444665
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(1) begin : LABEL_0
    if (id_7)
      if (1) id_1 <= id_9;
      else begin : LABEL_0
        if (1) id_1 <= !1;
      end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  reg id_4;
  assign id_3 = id_3 + id_1++ ? id_4 : id_3;
  reg  id_5;
  reg  id_6;
  reg  id_7;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_1,
      id_1,
      id_8,
      id_2,
      id_8,
      id_2,
      id_4
  );
  final begin : LABEL_0
    id_3 <= 1'b0;
  end
  reg id_9;
  id_10 :
  assert property (@(posedge (id_6)) id_7)
  else $display(id_9, id_6, id_9, id_4,, id_10 > id_9, 1, 1, 1, id_7);
  reg id_11;
  assign id_5 = (id_6);
  wire id_12;
  always @(*) begin : LABEL_0
    id_6 <= (id_3);
    id_11 = id_4;
  end
endmodule
