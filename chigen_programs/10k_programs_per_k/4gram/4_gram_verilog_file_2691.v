// Seed: 1762200164
module module_0 (
    input wor   id_0,
    input uwire id_1
);
  wire id_3;
  assign module_2._id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wire  id_1,
    input  wand  id_2,
    input  wor   id_3,
    output uwire id_4,
    output logic id_5,
    input  wand  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_6
  );
  always #(1) begin : LABEL_0
    id_5 <= 1;
  end
  wire id_9, id_10;
endmodule
module module_2 #(
    parameter id_2 = 32'd26,
    parameter id_7 = 32'd86
) (
    output wire id_0,
    input tri id_1,
    input tri _id_2,
    output wor id_3,
    input supply0 id_4,
    output tri id_5,
    input wor id_6,
    input tri0 _id_7,
    input uwire id_8,
    output wand id_9,
    input wand id_10,
    input uwire id_11,
    input wire id_12,
    output supply0 id_13,
    output supply1 id_14
);
  id_16 :
  assert property (@(posedge id_16 | -1) id_6)
  else $signed(68);
  ;
  module_0 modCall_1 (
      id_8,
      id_10
  );
  parameter id_17 = 1;
  wire [1  &  id_7 : id_2] id_18[-1 'b0 : -1];
  wire [1 : -1] id_19;
endmodule
