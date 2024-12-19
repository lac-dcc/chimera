// Seed: 1819627363
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = !id_3 & 1;
  reg id_4;
  always @* begin : LABEL_0
    id_3 <= id_3 ? 1 : id_4;
  end
endmodule
module module_1 (
    input tri0  id_0,
    input tri0  id_1,
    input wire  id_2,
    input uwire id_3
);
  assign id_5 = ({id_3{id_1}} | 1);
  always @(posedge 1 == id_1) begin : LABEL_0
    id_5 <= (1 == id_2);
    if (id_2 < 1) id_5 <= 1;
    else if (id_2) begin : LABEL_0
      if (id_2)
        if (id_0) begin : LABEL_0
          id_5 <= 1;
        end
    end
  end
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5
  );
endmodule
