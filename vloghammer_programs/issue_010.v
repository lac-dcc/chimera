module issue_010(a, b, y);
  // http://forums.xilinx.com/t5/Synthesis/Vivado-creates-netlist-with-inputs-shorted-together/td-p/397161
  input [5:0] a;
  input [3:0] b;

  // I have no clue why but Vivado 2013.4 generates a netlist containing:
  //
  //   assign \<const0>  = a[3];
  //   assign \<const0>  = a[2];
  //   assign \<const0>  = a[1];
  //   assign \<const0>  = b[3];
  //   assign \<const0>  = b[2];
  //   assign \<const0>  = b[1];
  //   assign \<const0>  = b[0];
  //
  //   IBUF IBUF
  //         (.I(\<const0> ),
  //          .O(xlnx_opt_));
  //
  // (when synthesized with (* use_dsp48 = "no" *) set on the module)

  wire [80:0] y0;
  wire [4:0] y1;
  wire [3:0] y2;

  output [89:0] y;
  assign y = {y0,y1,y2};

  assign y0  = 0;
  assign y1  = {4{{3{b}}}};
  assign y2  = 4'b1000 * a;
endmodule
