// Seed: 3797873740
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    output wand id_4,
    output supply1 id_5
);
  wire id_7;
  always @(posedge id_2 or posedge id_0) id_7 = id_7;
endmodule
module module_1 #(
    parameter id_10 = 32'd40,
    parameter id_9  = 32'd49
) (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    output supply0 id_5,
    input wor id_6
);
  case (1)
    1: begin : id_8
      defparam id_9.id_10 = 1'b0;
      assign id_4 = id_1;
    end
    default:
    genvar id_11;
  endcase
  wire id_12;
  assign id_5 = (1);
  module_0(
      id_0, id_1, id_1, id_6, id_4, id_4
  );
endmodule
