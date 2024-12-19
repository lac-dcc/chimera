// Seed: 3519125062
module module_0 (
    output wire id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input wand id_6,
    input tri1 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    output supply1 id_11
);
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1,
    input uwire id_2,
    output wire id_3,
    output wire id_4,
    input wand id_5,
    output logic id_6,
    input supply0 id_7,
    output tri id_8,
    input logic id_9,
    output supply1 id_10
);
  assign id_6 = id_9;
  assign id_3 = id_1;
  initial begin : LABEL_0
    if (1 || 1) begin : LABEL_0
      if (1) begin : LABEL_0
        if (1)
          if (1'b0)
            if (id_9) id_4 = id_2 >= 1'b0;
            else begin : LABEL_0
              id_6 <= 1'h0;
            end
      end
    end
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_7,
      id_7,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_8
  );
  assign modCall_1.id_8 = 0;
endmodule
