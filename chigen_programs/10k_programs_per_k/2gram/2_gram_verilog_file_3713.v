// Seed: 327797560
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input uwire id_2,
    input wire id_3,
    output supply0 id_4,
    input wand id_5,
    output tri0 id_6,
    output wire id_7,
    output wand id_8
    , id_19,
    output wor id_9,
    output tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri0 id_13,
    input uwire id_14,
    input tri1 id_15,
    input uwire id_16,
    input uwire id_17
);
  wire id_20;
  assign module_1.id_10 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd11,
    parameter id_5  = 32'd96,
    parameter id_6  = 32'd11
) (
    input  wor   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    output uwire id_3,
    output wor   id_4,
    input  wand  _id_5,
    input  tri   _id_6
);
  bit id_8;
  assign id_8 = id_8;
  for (id_9 = -1; -1; id_8 = id_1) begin : LABEL_0
    logic [id_5 : id_6] _id_10;
    ;
    wire id_11;
    wire id_12;
    assign id_12 = id_10;
    always begin : LABEL_1
      @(-1) id_9 = id_9;
    end
    logic [1 : 1  <  -1] id_13;
    always begin : LABEL_2
      fork
        id_13[id_10 : ""] <= id_10;
      join_any : SymbolIdentifier
    end
    wire id_14;
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_2,
      id_3,
      id_0,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
