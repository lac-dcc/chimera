// Seed: 2743083201
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    id_3 <= id_2;
    #1 id_1 = id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  if (~id_1) begin : LABEL_0
    wire id_4;
  end
  assign id_2 = 1;
  assign id_2 = id_3;
  id_5(
      .id_0(), .id_1(id_3), .id_2(1 - id_1), .id_3(id_3)
  );
  wire id_6;
  reg id_7, id_8, id_9, id_10;
  wire id_11;
  initial @(posedge id_7 or 1'h0 or 1) #(1) id_8 <= 1;
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_10,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
