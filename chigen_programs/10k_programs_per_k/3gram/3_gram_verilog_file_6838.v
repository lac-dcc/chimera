// Seed: 1246589243
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    output supply1 id_2,
    output wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wire id_6,
    output wor id_7,
    input wor id_8
);
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input  logic   id_0,
    input  supply0 id_1
    , id_6,
    input  logic   id_2,
    output supply1 id_3,
    output supply1 id_4
);
  reg id_7;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_1,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_5 = 0;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      id_6 <= id_2;
      if (~id_1) $display;
    end
  end
  wire id_8;
  assign id_6 = 1;
  wire id_9;
  wire id_10;
  always @(posedge 1) begin : LABEL_0
    id_7 <= 1;
  end
endmodule
