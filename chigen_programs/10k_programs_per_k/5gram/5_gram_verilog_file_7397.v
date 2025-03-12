// Seed: 478095695
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input wire id_3,
    output wor id_4,
    output tri id_5,
    output supply0 id_6,
    output tri0 id_7,
    output uwire id_8,
    input uwire id_9,
    input supply0 id_10,
    input supply0 id_11,
    output wor id_12,
    input tri1 id_13,
    output wand id_14,
    output tri1 id_15,
    output tri1 id_16,
    output uwire id_17
);
  final $signed(91);
  ;
  wire id_19;
  ;
  assign module_1.id_13 = 0;
  wire [1 : 1] id_20;
endmodule
module module_1 #(
    parameter id_10 = 32'd50,
    parameter id_12 = 32'd83,
    parameter id_3  = 32'd2,
    parameter id_6  = 32'd3,
    parameter id_9  = 32'd38
) (
    input supply1 id_0,
    output supply0 id_1,
    input supply0 id_2
    , _id_12,
    input uwire _id_3,
    output wand id_4,
    output logic id_5,
    input supply0 _id_6,
    output supply1 id_7,
    input tri1 id_8,
    output supply1 _id_9,
    input tri0 _id_10
);
  logic [(  1  ) : -1 'b0] id_13 = -1'b0;
  wire id_14;
  ;
  assign id_13 = 1;
  wire [id_3 : -1] id_15, id_16;
  always @(-1, posedge id_12) id_5 = id_13;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_1,
      id_8,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_0,
      id_8,
      id_8,
      id_4,
      id_0,
      id_7,
      id_4,
      id_7,
      id_7
  );
  union packed {
    logic [-1 : id_12  ==  id_10] id_17;
    logic [id_10 : id_9] id_18;
  } id_19;
  wire [-1 : id_6  ==  id_12] id_20;
endmodule
