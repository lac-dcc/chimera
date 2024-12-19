// Seed: 2863063056
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  tri1 id_7;
  assign id_3 = 1'b0 ==? id_7;
  always_ff @* begin : LABEL_0
    if (id_3) begin : LABEL_0
      id_3 = 1;
    end
  end
  id_8 :
  assert property (@(posedge 1) id_3)
  else $display;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
  wire id_4;
endmodule
