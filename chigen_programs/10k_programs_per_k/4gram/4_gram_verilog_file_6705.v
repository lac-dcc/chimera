// Seed: 1433896780
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
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = 1 & id_3;
  for (id_10 = 1; 1; id_7 = 1) begin : LABEL_0
    assign id_1 = id_6;
  end
  id_11 :
  assert property (@(posedge 1) id_4)
  else $display((1'h0));
  assign id_5 = 1 + id_6 | 1'b0;
  specify
    specparam id_12 = 1;
  endspecify
endmodule
module module_1 (
    input wire id_0,
    output wire id_1
    , id_7,
    output supply1 id_2,
    output tri id_3,
    input tri id_4,
    input supply0 id_5
);
  always @(*) $display(id_4, 1, 1);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign modCall_1.id_11 = 0;
endmodule
