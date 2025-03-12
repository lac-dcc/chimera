// Seed: 427366759
module module_0 (
    input uwire id_0,
    output tri id_1,
    input wor id_2,
    output wire id_3,
    input tri1 id_4,
    output wire id_5,
    input supply1 id_6,
    input tri id_7,
    input supply1 id_8,
    input supply1 id_9,
    output supply1 id_10,
    input tri0 id_11,
    output wand id_12,
    input wire id_13
);
  wire id_15;
  parameter id_16 = 1;
  assign #1 id_3 = 1;
  wire id_17;
  assign {-1 ? id_17 : 1'b0} = {id_2} + -1;
  assign id_10 = id_15;
  if (id_16) begin : LABEL_0
    begin : LABEL_1
      begin : LABEL_2
        assign id_10 = id_9;
      end
      wire [-1 : 1 'b0] id_18;
      wire id_19;
    end
  end
  always_ff $unsigned(35);
  ;
  wire id_20, id_21, id_22;
endmodule
module module_1 (
    input  wire  id_0,
    output tri0  id_1,
    input  uwire id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_12 = 0;
  assign id_1 = -1;
  parameter id_4[-1 : 1] = -1;
endmodule
