// Seed: 2248162850
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input supply0 id_3
);
  logic [-1 : 1] id_5;
  ;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd25,
    parameter id_3 = 32'd28,
    parameter id_5 = 32'd39
) (
    input uwire _id_0,
    output logic id_1,
    input wire id_2,
    input supply1 _id_3,
    input wire id_4,
    input tri0 _id_5,
    output tri0 id_6
);
  logic [7:0][id_0 : 1] id_8;
  always @(posedge -1) begin : LABEL_0
    if (1 | 1) begin : LABEL_1
      id_1 <= id_5;
    end else $clog2(81);
    ;
  end
  supply1 id_9;
  struct packed {
    logic [1  >  -1 'b0 : 1] id_10;
    logic [id_5 : -1] id_11;
  } id_12;
  ;
  assign id_12.id_11 = id_9 & -1 & id_8;
  wire \id_13 ;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_4
  );
  assign id_9 = id_8[id_3] == 1'b0 - id_12.id_10;
endmodule
