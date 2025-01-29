// Seed: 1441084504
module module_0 (
    id_1
);
  input wire id_1;
  always @(negedge id_1) begin : LABEL_0
    release id_2;
    #1 begin : LABEL_0
      #1 id_3 = 1 + id_2 - id_1;
    end
    @(posedge -1'h0) id_2 = -1;
  end
  id_4(
      .id_0(id_1)
  );
  wire id_5, id_6;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output wand id_2
);
  supply1 id_4;
  parameter id_5 = id_4;
  module_0 modCall_1 (id_5);
endmodule
