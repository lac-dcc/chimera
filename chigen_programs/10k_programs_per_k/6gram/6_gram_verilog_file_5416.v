// Seed: 1860895307
module module_0 #(
    parameter id_7 = 32'd27,
    parameter id_8 = 32'd36
) (
    output tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    output uwire id_3,
    output supply0 id_4
);
  generate
    for (id_6 = id_6; 1; id_0 = (id_2)) begin
      defparam id_7.id_8 = 1;
    end
  endgenerate
  notif1 (id_3, id_1, id_6);
  module_2(
      id_6
  );
  always disable id_9;
endmodule
module module_1 (
    output tri   id_0,
    input  wand  id_1,
    output uwire id_2
);
  assign id_0 = 1;
  module_0(
      id_2, id_1, id_1, id_0, id_2
  );
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
endmodule
