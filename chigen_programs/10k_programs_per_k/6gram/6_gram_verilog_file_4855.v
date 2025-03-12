// Seed: 2584661056
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    output tri  id_2,
    output wire id_3
);
  parameter id_5 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd37
) (
    output wor id_0,
    input supply0 id_1,
    input supply1 _id_2,
    inout tri1 id_3,
    output tri1 id_4,
    input tri id_5,
    output tri id_6
    , id_8
);
  wire id_9;
  ;
  parameter [-1 'b0 : -1] id_10 = -1;
  logic [7:0] id_11;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_6
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = {id_1{id_2}} & id_3;
  parameter id_12 = -1;
  assign id_6 = id_3;
  logic [7:0] id_13;
  ;
  always @(posedge id_3 or id_11[1 : id_2]) begin : LABEL_0
    if (1) begin : LABEL_1
      id_13[""] += id_1;
    end
  end
endmodule
