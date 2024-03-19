//**************************************************************************
// Verilog Components: Arithmetic Components
//--------------------------------------------------------------------------
// $Id: vcArith.v,v 1.2 2006/03/05 07:03:31 cbatten Exp $
//

//--------------------------------------------------------------------  
// Adders
//--------------------------------------------------------------------

module vcAdder #( parameter W = 1 )
(
  input  [W-1:0] in0, in1,
  input          cin,
  output [W-1:0] out,
  output         cout
);

  assign {cout,out} = in0 + in1 + cin;

endmodule

module vcAdder_simple #( parameter W = 1 )
(
  input  [W-1:0] in0, in1,
  output [W-1:0] out
);

  assign out = in0 + in1;

endmodule

//--------------------------------------------------------------------  
// Subtractor
//--------------------------------------------------------------------

module vcSubtractor #( parameter W = 1 )
(
  input  [W-1:0] in0, in1,
  output [W-1:0] out
);

  assign out = in0 - in1;

endmodule

//--------------------------------------------------------------------  
// Incrementer
//--------------------------------------------------------------------

module vcInc #( parameter W = 1, parameter INC = 1 )
(
  input  [W-1:0] in,
  output [W-1:0] out
);

  assign out = in + INC;

endmodule

//--------------------------------------------------------------------  
// Zero-Extension
//--------------------------------------------------------------------

module vcZeroExtend #( parameter W_IN = 1, parameter W_OUT = 8 )
(
  input  [W_IN-1:0]  in,
  output [W_OUT-1:0] out
);

  assign out = { {(W_OUT-W_IN){1'b0}}, in };

endmodule

//--------------------------------------------------------------------  
// Sign-Extension
//--------------------------------------------------------------------

module vcSignExtend #( parameter W_IN = 1, parameter W_OUT = 8 )
(
  input  [W_IN-1:0]  in,
  output [W_OUT-1:0] out
);

  assign out = { {(W_OUT-W_IN){in[W_IN-1]}}, in };

endmodule

//--------------------------------------------------------------------  
// Equal comparator
//--------------------------------------------------------------------

module vcEQComparator #( parameter W = 1 )
(
  input  [W-1:0] in0,
  input  [W-1:0] in1,
  output         out
);

  assign out = ( in0 == in1 );

endmodule

//--------------------------------------------------------------------  
// Less-Than Comparator
//--------------------------------------------------------------------

module vcLTComparator #( parameter W = 1 )
(
  input  [W-1:0] in0,
  input  [W-1:0] in1,
  output         out
);

  assign out = ( in0 < in1 );

endmodule


