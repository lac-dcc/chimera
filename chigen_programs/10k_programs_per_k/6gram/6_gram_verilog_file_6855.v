// Seed: 1698857859
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    input wire id_5,
    input tri0 id_6
);
  wire  id_8;
  logic id_9;
  ;
  logic   id_10 = 1'h0;
  supply1 id_11 = -1, id_12;
endmodule
module module_1 (
    input  supply0 id_0,
    output supply0 id_1
);
  logic [1 : 1] id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wire id_4;
  ;
  always @(posedge id_4) begin : LABEL_0
    deassign id_1;
  end
endmodule
