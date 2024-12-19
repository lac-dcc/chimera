// Seed: 498151512
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  supply1 id_7 = 1;
  assign id_3 = id_7;
  tri0 id_8 = 1;
  wire id_9;
endmodule
module module_1 (
    input tri   id_0,
    input uwire id_1,
    input tri0  id_2
);
  always @(id_1 or posedge (1)) begin : LABEL_0
    id_4 <= 1;
    id_4 <= (1);
    if (1) begin : LABEL_0
      id_4 = 1;
    end else id_4 = id_4 + 1;
  end
  assign id_5 = id_0;
  id_6 :
  assert property (@(posedge id_0) id_0)
  else begin : LABEL_0
    if (id_5) id_6 = id_1;
  end
  supply1 id_7;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
