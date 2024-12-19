// Seed: 3747908888
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    output tri1 id_2,
    output supply0 id_3
);
  if (1) assign id_1 = 1;
  else begin : LABEL_0
    id_5(
        .id_0(), .id_1(1'b0), .id_2(id_1), .id_3(1), .id_4(id_3), .id_5(id_0), .id_6(1'b0)
    );
  end
endmodule
module module_1 (
    input supply0 id_0,
    inout supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output uwire id_5
);
  id_7(
      .id_0("" && id_0 && 1'b0 && 1 && ""), .id_1(id_5)
  );
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
