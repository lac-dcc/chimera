// Seed: 3758289535
module module_0 (
    output wand id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    output wand id_3
);
  wire id_5;
  wire id_6;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    output uwire id_2,
    input supply1 id_3,
    output wor id_4,
    output wor id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_2
  );
endmodule
module module_2 (
    input wand id_0,
    output tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wire id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8,
    input wor id_9,
    output wire id_10,
    input wire id_11,
    output tri0 id_12,
    input supply1 id_13,
    output supply0 id_14,
    output logic id_15,
    input logic id_16,
    output supply1 id_17,
    input tri id_18,
    input tri id_19
);
  id_21 :
  assert property (@(posedge id_21) 1) begin : LABEL_0
    id_15 = 1;
    begin : LABEL_0
      id_2 = id_19;
      $display((id_0));
      id_15 <= -1 ? id_16 : -1'h0;
    end
  end
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_8,
      id_1
  );
endmodule
