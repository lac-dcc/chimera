// Seed: 639844064
module module_0 (
    output wire id_0,
    output supply0 id_1,
    input wand id_2,
    output supply0 id_3,
    input supply1 id_4,
    input uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input uwire id_8,
    output tri0 id_9
);
  logic [7:0] id_11;
  id_12 :
  assert property (@(posedge 1) 1)
  else $clog2(35);
  ;
  wire [1 : -1] id_13, id_14;
  assign id_11[1'b0] = id_4;
  always @(posedge 1) begin : LABEL_0
    assert (id_0++);
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd53,
    parameter id_5 = 32'd97,
    parameter id_6 = 32'd32
) (
    output tri0 id_0,
    output logic id_1,
    input supply0 id_2,
    input uwire _id_3
);
  _id_5 :
  assert property (@(posedge id_3) -1)
  else $unsigned(37);
  ;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_5 = 0;
  wire [1  &&  id_5 : id_3] _id_6;
  wire [id_6 : -1 'h0] id_7;
  initial begin : LABEL_0
    id_1 <= id_5 ? 1 : id_7;
  end
endmodule
