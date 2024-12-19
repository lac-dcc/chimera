// Seed: 2264446521
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output wand id_2,
    input tri0 id_3,
    input wand id_4,
    output uwire id_5,
    output supply1 id_6
);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1
  );
endmodule
module module_2 (
    output uwire id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wire id_4,
    input supply1 id_5,
    input tri id_6,
    output tri1 id_7,
    input supply1 id_8,
    input wand id_9,
    input supply0 id_10,
    output tri id_11
);
  tri id_13;
  reg id_14;
  reg id_15;
  supply1 id_16;
  logic [7:0] id_17;
  always @(posedge (1) or posedge id_13) begin : LABEL_0
    id_13 = 1;
    if (id_10) disable id_18;
    else if (1) id_14 <= #id_8 id_15;
    else $display((id_13 ? !id_1 >>> id_17[1==1'd0] : id_16) != 1);
  end
  module_0 modCall_1 (
      id_7,
      id_11,
      id_0,
      id_2,
      id_2,
      id_7,
      id_7
  );
  assign modCall_1.type_11 = 0;
endmodule
