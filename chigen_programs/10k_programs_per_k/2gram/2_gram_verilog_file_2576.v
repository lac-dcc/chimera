// Seed: 2756468262
module module_0;
  logic [7:0] id_2;
  assign id_1[1] = 1'd0;
  assign id_1 = id_2;
  id_3(
      .id_0(id_2), .id_1(1)
  );
  wire id_4;
endmodule
module module_1;
  module_0 modCall_1 ();
  id_2(
      .id_0(1)
  );
  assign id_1 = 1;
  wire id_3;
  wire id_4;
endmodule
module module_2 (
    input supply1 id_0,
    input wire id_1,
    output wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    output tri id_7,
    input tri id_8
    , id_11,
    input supply1 id_9
);
  module_0 modCall_1 ();
  logic [7:0] id_12;
  wire id_13;
  logic [7:0] id_14 = id_12;
  and primCall (id_2, id_3, id_5, id_6, id_8, id_9);
  wor  id_15 = id_14[1'b0];
  wire id_16 = id_9;
  always
    if (id_15 < 1) begin : LABEL_0
      id_16 = 1;
    end
endmodule
