// Seed: 2559732185
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  assign module_1.id_5 = 0;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire [-1 : ""] id_6, id_7;
endmodule
program module_1;
  logic id_1;
  for (id_2 = 1; -1; id_2 = id_2) begin : LABEL_0
    id_3 :
    assert property (@(posedge id_2 or posedge -1) id_2) begin : LABEL_1
      id_3 <= id_3;
    end
    begin : LABEL_2
      wire id_4;
    end
  end
  specify
    if (id_2) (posedge id_5 => (id_6 +: 1'b0)) = (-1'b0);
  endspecify
  wire id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_7,
      id_6,
      id_6
  );
endprogram
