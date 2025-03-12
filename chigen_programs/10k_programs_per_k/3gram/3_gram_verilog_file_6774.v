// Seed: 516740837
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input wire id_2,
    input wire id_3,
    input supply1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    output wor id_7,
    input supply0 id_8,
    output supply0 id_9,
    output uwire id_10,
    input wand id_11,
    input tri id_12,
    output uwire id_13,
    input tri1 id_14
);
  assign id_10 = id_1;
  wire id_16, id_17, id_18, \id_19 ;
  parameter id_20 = -1'b0;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    input wire id_2,
    input wire id_3,
    output logic id_4,
    input supply1 id_5,
    output tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    inout wor id_9
);
  initial begin : LABEL_0
    #1
    @(negedge id_7) begin : LABEL_1
      id_4 <= id_5;
    end
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_9
  );
endmodule
