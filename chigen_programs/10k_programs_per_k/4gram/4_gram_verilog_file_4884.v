// Seed: 858728706
module module_0;
  assign id_1[1] = id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  int id_3;
  module_0 modCall_1 ();
  assign id_1 = 1 ? id_4 : 1;
  reg id_5;
  always @(id_3 or id_5)
    if (id_1) begin : LABEL_0
      fork
        if (id_4) for (id_3 = id_2; ~id_3; id_1 = 1) id_1 = id_1++;
      join
      id_3 <= id_1;
    end else begin : LABEL_0$display
      ;
    end
  reg id_6;
  assign id_3 = id_4;
  assign id_5 = 1 ? !id_2 : id_6;
  wire id_7;
endmodule
