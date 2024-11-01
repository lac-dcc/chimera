// Seed: 694008157
module module_0 (
    output wor id_0,
    input uwire id_1,
    output supply1 id_2,
    output tri1 id_3
);
  wire id_5;
  assign id_3 = {1{1'b0}};
  case (1)
    default:
    begin
      wire id_6, id_7;
    end
    1: wor id_8, id_9;
  endcase
  wire id_10;
  specify
    (id_11 => id_12) = (!0, id_8);
    if (id_12) (id_13 *> id_14) = (id_8);
    (id_15 *> module_0) = (1);
  endspecify
  wire id_16;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2
);
  always id_1 = id_2;
  assign id_1 = id_0 && 1'b0;
  module_0(
      id_1, id_2, id_1, id_1
  );
  assign id_1 = id_2;
endmodule
