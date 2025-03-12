// Seed: 2561858923
module module_0 (
    output wand id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    output wand id_6,
    input wand id_7,
    input wor id_8,
    output tri id_9,
    input uwire id_10,
    output supply0 id_11
);
  wire id_13;
  initial begin : LABEL_0
    logic [1 : -1] id_14, id_15, id_16;
    assert (-1);
  end
  wire id_17;
  ;
  assign id_9  = id_4;
  assign id_13 = (id_4);
endmodule
module module_1 #(
    parameter id_0 = 32'd52,
    parameter id_3 = 32'd99
) (
    input  wor   _id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  tri   _id_3,
    output wor   id_4
);
  assign id_4 = -1;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4
  );
  wire id_7;
  always @(posedge id_7 or posedge id_3) begin : LABEL_0
    wait (id_0);
  end
  struct packed {
    logic [id_3 : -1] id_8;
    logic id_9;
  } [1  -  id_0 : 1 'h0 -  id_0] id_10 = 1;
  always @(posedge id_1#(.id_1(-1 & 1),
      .id_0(1)
  ))
  begin : LABEL_1
    wait (-1);
  end
  assign id_10 = -1;
  uwire id_11;
  assign id_11 = 1;
endmodule
