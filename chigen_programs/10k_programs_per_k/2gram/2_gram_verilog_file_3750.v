// Seed: 750466256
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    output wor id_4,
    input uwire id_5,
    output tri0 id_6
    , id_14,
    input supply0 id_7,
    input tri1 id_8,
    output supply1 id_9,
    output uwire id_10,
    input uwire id_11#(.id_15(1)),
    input uwire id_12
);
  assign id_0 = 1'b0;
  if (1) uwire id_16 = id_11;
  else begin
    id_17(
        .id_0(1), .id_1(id_0 - id_15 ? id_14 : 1)
    );
    wire id_18;
    id_19(
        .id_0(1'h0 - "")
    );
    supply0 id_20 = id_1(1, 1) == 1;
    assign id_3 = id_8;
    wire id_21;
  end
  tri1 id_22;
  wire id_23;
  assign id_10 = id_22 - id_15;
  wire id_24;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    input  wand  id_2,
    input  wire  id_3,
    input  wire  id_4,
    output uwire id_5,
    output tri1  id_6,
    input  tri1  id_7,
    input  wor   id_8,
    input  wor   id_9
);
  assign id_6 = id_8;
  assign id_5 = id_2;
  module_0(
      id_6, id_2, id_1, id_5, id_5, id_0, id_6, id_1, id_2, id_6, id_6, id_3, id_3
  ); id_11(
      .id_0(id_3 === ~1)
  );
endmodule
