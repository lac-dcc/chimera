// Seed: 902890492
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  wand id_4 = 1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  reg id_2;
  reg id_3 = id_2;
  always
    if (1) id_3 = 1;
    else begin
      id_2 = id_3;
      #1 id_2 <= id_2;
      assign id_2[1-1 : 1'b0] = ({1{id_3}});
    end
  wire id_4;
  assign #id_5 id_1 = id_2;
  module_0(
      id_4, id_4
  );
endmodule
