// Seed: 414694974
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    output wire id_6,
    input uwire id_7,
    input wand id_8,
    output tri1 id_9
);
  assign id_6 = {1{id_8}};
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output tri1  id_2
);
  assign id_1 = -1;
  assign id_1 = id_0;
  logic [7:0] id_4, id_5;
  nor primCall (id_2, id_0, id_4);
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_4[1] = -1;
      id_1 <= -1;
    end
    begin : LABEL_2
      if (1)
        assume (id_0);
        else begin : LABEL_3
          disable id_6;
        end
    end
  end
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
