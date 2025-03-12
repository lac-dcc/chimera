// Seed: 3509185640
module module_0 #(
    parameter id_13 = 32'd28
) (
    input uwire id_0,
    output tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5,
    input uwire id_6,
    output tri id_7
);
  assign id_7 = (id_4) ? 1 : id_6;
  wire id_9;
  logic [7:0] id_10, id_11, id_12, _id_13, id_14, id_15;
  wire id_16;
  assign id_11[id_13] = id_16#(.id_14(1)) && id_4;
  wire id_17;
  parameter id_18 = -1;
  initial begin : LABEL_0
    $clog2(28);
    ;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input tri id_2
    , id_13,
    input uwire id_3,
    output logic id_4,
    output tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input supply0 id_10,
    input supply1 id_11
);
  always @(~id_10 or posedge id_7) begin : LABEL_0
    #1;
    id_4 = id_9;
  end
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_3,
      id_11,
      id_9,
      id_7,
      id_1
  );
endmodule
