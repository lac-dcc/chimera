// Seed: 1363838576
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  and primCall (id_6, id_4, id_7, id_3, id_2, id_5, id_1);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(negedge id_1)
    if (1) id_2 <= 1 | 1;
    else
      case (id_3)
        id_8[1]: id_3 = 1 == 1;
        id_6:
        fork
          $display(1 - id_4);
          wait (1);
          id_2 = 1;
        join_none : SymbolIdentifier
        default: id_6 <= 1'b0;
      endcase
  always @(negedge id_4);
  wor id_9;
  nor primCall (id_6, id_4, id_5, id_9, id_7, id_1, id_8, id_3, id_2);
  assign id_8 = id_5[1'b0];
  assign id_2 = id_9 == {1, id_7};
  module_0 modCall_1 (
      id_4,
      id_9,
      id_9,
      id_9,
      id_4
  );
  wire id_10;
endmodule
