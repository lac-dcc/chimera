// Seed: 3739740025
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri id_3,
    input uwire id_4,
    output tri0 id_5
);
  wand id_7;
  wire id_8;
  assign id_7 = (-1'd0) ? -1 : 1;
  logic id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd2,
    parameter id_14 = 32'd57,
    parameter id_8  = 32'd32
) (
    input tri1 id_0
    , _id_10,
    output tri id_1,
    output logic id_2
    , id_11,
    input supply1 id_3,
    output tri id_4,
    input wand id_5,
    output tri id_6,
    input tri0 id_7,
    input uwire _id_8
);
  always @(posedge -1) begin : LABEL_0
    if (-1'b0) deassign id_11[id_10];
    id_2 = -1;
  end
  always @(id_10) begin : LABEL_1
    disable id_12;
  end
  wire id_13;
  wire _id_14;
  wire [id_8 : id_14] id_15;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_7,
      id_5,
      id_1
  );
  assign modCall_1.id_5 = 0;
  id_16 :
  assert property (@(posedge id_13) id_15)
  else $signed(23);
  ;
endmodule
