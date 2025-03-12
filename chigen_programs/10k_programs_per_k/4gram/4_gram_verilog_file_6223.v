// Seed: 2052800674
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    output wire id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8,
    input tri0 id_9,
    input wor id_10,
    input tri id_11,
    input supply1 id_12
);
  wire id_14;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd28,
    parameter id_6  = 32'd99
) (
    input supply1 id_0,
    input supply0 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri _id_6,
    input wor id_7,
    input wand id_8,
    output supply0 id_9
    , _id_13,
    output wor id_10,
    output logic id_11
);
  integer [id_6 : 1  &  -1 'b0] id_14;
  for (id_15 = 1; -1; id_11 = 1) begin : LABEL_0
    always @(posedge id_6 or negedge id_0) id_15 = "";
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_8,
      id_2,
      id_8,
      id_8,
      id_7,
      id_5,
      id_5,
      id_8,
      id_1,
      id_0,
      id_5
  );
  id_16 :
  assert property (@(negedge -1 | id_0 ** (id_5)) id_7)
  else $signed(33);
  ;
  wire [-1 : 1] id_17;
  wire [1  ==  id_13 : -1] id_18;
endmodule
