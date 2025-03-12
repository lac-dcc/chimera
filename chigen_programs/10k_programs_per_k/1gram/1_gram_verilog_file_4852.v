// Seed: 3990223756
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    output supply0 id_5,
    output tri0 id_6
);
  wire id_8;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output wire id_0,
    output logic id_1,
    output supply1 id_2,
    output tri1 id_3,
    input tri id_4,
    output tri1 id_5,
    output wire id_6,
    input supply1 id_7[!  -1 : 1],
    input logic id_8,
    output tri id_9,
    input tri id_10
);
  assign id_6 = id_8;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_0,
      id_7,
      id_7,
      id_2,
      id_6
  );
  id_12 :
  assert property (@(posedge -1'b0) id_8) begin : LABEL_0
    begin : LABEL_1
      id_1.id_8 = -1'd0;
    end
  end
endmodule
