// Seed: 3887595768
module module_0 (
    input wire id_0,
    input wand id_1,
    output supply1 id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply0 id_5
    , id_8,
    output supply1 id_6
);
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    input wire id_2,
    output logic id_3,
    input wor id_4,
    output wire id_5
);
  always
    if (1) begin : LABEL_0
      $signed(90);
      ;
    end else begin : LABEL_1
      @(negedge -1'd0 or posedge 1) id_3 <= id_4;
    end
  and primCall (id_5, id_8, id_7, id_4, id_2);
  wire id_7 = id_4;
  supply0 id_8 = 1'h0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_2,
      id_4,
      id_1,
      id_5
  );
  assign id_1 = id_4;
endmodule
