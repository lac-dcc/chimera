// Seed: 4128891790
module module_0 #(
    parameter id_8 = 32'd35
) (
    input uwire id_0,
    input tri0 id_1,
    output tri1 id_2,
    input wand id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri1 _id_8,
    input wor id_9,
    input tri id_10,
    output tri1 id_11,
    output tri0 id_12,
    input wor id_13,
    input wor id_14
    , id_21,
    output supply1 id_15,
    input tri0 id_16,
    input wand id_17,
    input tri id_18,
    input wor id_19
);
  integer [!  id_8 : 1] id_22;
  assign module_1.id_18 = 0;
endmodule
module module_1 #(
    parameter id_15 = 32'd87
) (
    input tri1 id_0,
    output tri1 id_1,
    output wand id_2,
    input uwire id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    output uwire id_7,
    output wand id_8,
    input wor id_9,
    output supply0 id_10,
    input uwire id_11,
    input supply1 id_12,
    output uwire id_13
);
  parameter id_15 = 1;
  id_16 :
  assert property (@(posedge id_11) id_4)
  else $unsigned(id_15);
  ;
  assign id_13 = -1'h0 ? id_4 : id_9;
  logic id_17;
  logic id_18 = 1, id_19;
  integer id_20;
  assign id_6 = id_9;
  assign id_2 = -1;
  always_latch @(*) begin : LABEL_0
    $clog2(id_15);
    ;
  end
  assign id_10 = id_19;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_6,
      id_4,
      id_4,
      id_6,
      id_3,
      id_9,
      id_15,
      id_9,
      id_12,
      id_13,
      id_10,
      id_12,
      id_0,
      id_8,
      id_9,
      id_12,
      id_5,
      id_11
  );
  defparam id_15.id_15 = !id_15;
endmodule
