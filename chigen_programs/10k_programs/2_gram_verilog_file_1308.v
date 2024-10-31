// Seed: 2016453100
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign {id_2, id_1, 1} = 1;
  wand id_7;
  assign id_6 = id_6++;
  specify
    (id_8 => id_9) = (1  : id_1  : 1, id_2  : 1  : 1'b0);
    (negedge id_10 => (id_11 +: (1 && 1'h0 && id_9))) = (id_9  : (1): 1, id_8  : 1  : id_10);
    (id_12 => id_13) = 0;
    (id_14 *> id_15) = 1;
    (id_16 => id_17) = (id_10  : 1  : 1'b0 < 1, {id_11, 1, ~1'b0, 1, 1'b0, 1} : 1  : id_14);
    (negedge id_18 => (id_19 +: 1)) = (1  : 1'h0 : id_7, 1 ? id_7 : 1);
    $width(negedge id_20, id_20);
  endspecify
endmodule
module module_1 ();
  wire id_2;
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2
  );
endmodule
