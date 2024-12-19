// Seed: 2992023793
module module_0 (
    input supply1 id_0,
    input tri1 id_1
);
  for (id_3 = 1; ~id_0; id_3++) begin : LABEL_0
    if (1) begin : LABEL_0
      wor id_4 = id_0;
    end else begin : LABEL_0
      assign id_3 = id_3 ? id_1 : 1 == 1'b0;
    end
  end
  id_6(
      id_3, id_3
  );
endmodule
module module_1 (
    output tri1 id_0,
    input  wor  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    input  wor  id_0,
    output tri1 id_1
);
  wire id_3;
  xnor primCall (id_1, id_3, id_0);
  module_0 modCall_1 (
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
