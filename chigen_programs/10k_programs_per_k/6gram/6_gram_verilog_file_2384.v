// Seed: 1865315860
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input wor id_2,
    input wor id_3,
    input tri id_4,
    output uwire id_5
);
  wire id_7;
  assign id_1 = 1'b0 - 1;
  module_2();
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    output wor id_3,
    input uwire id_4,
    output wor id_5
);
  wire id_7;
  module_0(
      id_0, id_5, id_4, id_2, id_2, id_3
  );
  wire id_8;
endmodule
module module_2;
  always @(id_1 or posedge 1'b0)
    case (1)
      {id_1, 1} : id_1 = 1 ~^ id_1;
      default: ;
    endcase
endmodule
