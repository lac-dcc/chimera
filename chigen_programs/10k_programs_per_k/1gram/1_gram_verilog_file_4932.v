// Seed: 595829507
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire [1 : 1] id_9, id_10;
  wire id_11;
  generate
    id_12 :
    assert property (@(~id_8 or posedge "") id_8);
  endgenerate
endmodule
module module_1 #(
    parameter id_1 = 32'd31,
    parameter id_8 = 32'd39
) (
    output wire id_0,
    input wire _id_1,
    input wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    input uwire _id_8
);
  id_10 :
  assert property (@(posedge id_10) 1) begin : LABEL_0
    id_10 <= id_7;
  end
  assign id_0 = id_4;
  wire [1  +  1 : id_8  -  -1  !=?  id_1] id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
  wire id_12;
  wire id_13;
endmodule
